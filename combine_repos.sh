#!/bin/bash

RESULT=${PWD##*/}

declare -a REPOS=(fishermans_blues jumbo ocean_subset senorita senorita_prologue seven_veils single_petal_of_a_rose sowhat whole_of_the_moon)
# declare -a REPOS=(fishermans_blues)

# echo ${RESULT}
# echo ${DIR_LIST}



git init

for i in ${REPOS[@]}; do
  mkdir ${i}
  cd ${i}
  git filter-repo --to-subdirectory-filter ${i}
  cd ..
  git remote add ${i} ../${i}
  git fetch ${i}
  git merge --allow-unrelated-histories ${i}/master
  mv ${i}.* ${i}/
  mv music ${i}/
  git remote rm ${i}
done


