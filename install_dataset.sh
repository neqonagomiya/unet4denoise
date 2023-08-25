#bin/bash

# dataset path
dataset_dir="./dataset"
train_dir="/train"
eval_dir="/eval"
clean_dir="/clean"
noisy_dir="/noisy"

# dataset in this url https://datashare.ed.ac.uk/handle/10283/2791
clean_testset_wav_url="https://datashare.ed.ac.uk/bitstream/handle/10283/2791/clean_testset_wav.zip?sequence=1&isAllowed=y"
noisy_testset_wav_url="https://datashare.ed.ac.uk/bitstream/handle/10283/2791/noisy_testset_wav.zip?sequence=5&isAllowed=y"
clean_trainset_28spk_wav_url="https://datashare.ed.ac.uk/bitstream/handle/10283/2791/clean_trainset_28spk_wav.zip?sequence=2&isAllowed=y"
noisy_train_28spk_wav_url="https://datashare.ed.ac.uk/bitstream/handle/10283/2791/noisy_trainset_28spk_wav.zip?sequence=6&isAllowed=y"
#testset_txt_url=https://datashare.ed.ac.uk/bitstream/handle/10283/2791/testset_txt.zip?sequence=8&isAllowed=y
#trainset_28spk_txt_url=https://datashare.ed.ac.uk/bitstream/handle/10283/2791/trainset_28spk_txt.zip?sequence=9&isAllowed=y
#logfile_url=https://datashare.ed.ac.uk/bitstream/handle/10283/2791/logfiles.zip?sequence=4&isAllowed=y
#license_txt_url=https://datashare.ed.ac.uk/bitstream/handle/10283/2791/license_text?sequence=11&isAllowed=y


dataset_dir_list=(
    $dataset_dir
    $dataset_dir$train_dir
    $dataset_dir$eval_dir
    $dataset_dir$train_dir$clean_dir
    $dataset_dir$train_dir$noisy_dir
    $dataset_dir$eval_dir$clean_dir
    $dataset_dir$eval_dir$noisy_dir
)

dataset_url_list=(
    $clean_trainset_28spk_wav_url
    $noisy_train_28spk_wav_url
    $clean_testset_wav_url
    $noisy_testset_wav_url
)

zip_name_list=(
    clean_trainset_28spk_wav.zip
    noisy_train_28spk_wav.zip
    clean_testset_wav.zip
    noisy_testset_wav.zip
)

for dataset_dir_path in "${dataset_dir_list[@]}" ; do
    if [ ! -d ${dataset_dir_path} ]; then
        mkdir ${dataset_dir_path} 
        echo "make dir in ${dataset_dir_path}" 
    else
        echo "already exist ${dataset_dir_path}"
    fi

done

for i in "${!dataset_url_list[@]}" ; do
    #for dataset_dir_path in "${dataset_dir_list[@]}"
    dataset_url=${dataset_url_list[$i]}
    dataset_dir_path=${dataset_dir_list[$(( $i+3 ))]}
    zip_name=${zip_name_list[$i]}
    echo "${dataset_dir_path}"
    echo "${dataset_url}"
    if [ -s ${dataset_dir_path} ] ; then
        wget -O ${dataset_dir_path}"/"${zip_name} ${dataset_url}
        echo "fin download"
    else
        echo "already file exist ${dataset_dir_path}, so you need delete it"
    fi
done
