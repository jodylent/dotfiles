########################################
# Jody Lent
########################################

# Check for REPO vars:
# -- REPODIR directory
# -- REPOLIST list of `git remote get-url origin` values
# Set these vars in your .bashrc
echo
echo "--------------------------------------------------------------------------------"
echo "--------------------------------------------------------------------------------"
if [ -z ${REPODIR+x} ]; then echo "REPODIR is unset"; else echo "REPODIR is set to '$REPODIR'"; fi
if [ -z ${REPOLIST+x} ]; then echo "REPOLIST is unset"; else echo "REPOLIST is set to '$REPOLIST'"; fi
echo "--------------------------------------------------------------------------------"
echo "--------------------------------------------------------------------------------"
echo

mkdir -p ${REPODIR}

##############################
# Refresh selected repos
##############################
for REPO in ${REPOLIST}; do
    REPONAME=`python -c "repostr = \"${REPO}\"; print(repostr.split('.git')[0].split('/')[-1])"`
    echo
    echo "--------------------------------------------------------------------------------"
    echo "REPODIR: ${REPODIR}"
    echo "REPO: ${REPONAME} : ${REPO}"
    echo "--------------------------------------------------------------------------------"
    echo
    [[ -d ${REPODIR}/${REPONAME} ]] || git clone ${REPO} 2>/dev/null
    BRANCH=`git -C ${REPODIR}/${REPONAME} status|awk -F " " '{print $3}'|head -n 1`
    if [[ $BRANCH == "master" ]]; then
        # echo "${REPODIR}/${REPONAME}:    UPDATING ${BRANCH}"
        git -C ${REPODIR}/${REPONAME} pull origin $BRANCH
    elif [[ $BRANCH == "" ]]; then
        echo "${REPODIR}/${REPONAME}:  NOT A GIT REPO"
    else
        # echo "${REPODIR}/${REPONAME}:    UPDATING master FIRST, THEN ${BRANCH}"
        git -C ${REPODIR}/${REPONAME} checkout master &&
        git -C ${REPODIR}/${REPONAME} pull origin master
        git -C ${REPODIR}/${REPONAME} checkout $BRANCH &&
        git -C ${REPODIR}/${REPONAME} pull origin $BRANCH
    fi
done
