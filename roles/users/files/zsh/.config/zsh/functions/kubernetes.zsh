function kubernetes-scaffold()
{
    echo "
    apiVersion: v1
    kind:
    metadata:

    spec:

    EOT" > $1
}

function forcePVCDelete() {
    kubectl patch "$1" cmy-sentry-data -p '{"metadata":{"finalizers":null}}'
}


function reload-kubectl-contexts() {
    #clean previous contexts
    unset KUBECONFIG
    ##########################
    # KUBERNETES CONFIGS     #
    ##########################
    # Set the default kube context if present
    MINIKUBE_KUBECONFIG="$HOME/.kube/minikube-config.yaml"
    if test -f "${MINIKUBE_KUBECONFIG=${KUBECONFIG}}"
    then
        export KUBECONFIG=$MINIKUBE_KUBECONFIG
    fi

    # Additional contexts should be in ~/.kube/custom-contexts/
    CUSTOM_KUBE_CONTEXTS="$HOME/.kube/contexts"
    mkdir -p "${CUSTOM_KUBE_CONTEXTS}"
    OIFS="$IFS"
    IFS=$'\n'
    for contextFile in `find "${CUSTOM_KUBE_CONTEXTS}" -type f -name "*.yaml"`
    do
        export KUBECONFIG="$contextFile:$KUBECONFIG"
    done
    IFS="$OIFS"
}
