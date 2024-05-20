nvcc \
    -t 12 \
    --generate-code=arch=compute_50,code=[compute_50,sm_50] \
    --generate-code=arch=compute_52,code=[compute_52,sm_52] \
    --generate-code=arch=compute_61,code=[compute_61,sm_61] \
    --generate-code=arch=compute_70,code=[compute_70,sm_70] \
    --generate-code=arch=compute_75,code=[compute_75,sm_75] \
    --generate-code=arch=compute_80,code=[compute_80,sm_80] \
    -DGGML_CUDA_DMMV_X=32 \
    -DGGML_CUDA_PEER_MAX_BATCH_SIZE=128 \
    -DGGML_CUDA_MMV_Y=1 \
    -DGGML_USE_CUDA=1 \
    -DGGML_SHARED=1 \
    -DGGML_BUILD=1 \
    -DGGML_USE_LLAMAFILE \
    -D_GNU_SOURCE \
    -Wno-deprecated-gpu-targets \
    --forward-unknown-to-host-compiler \
    -use_fast_math \
    -link \
    -shared \
    -fPIC \
    -I. \
    -lcuda -lcublas -lcudart -lcublasLt \
    -O3 \
    -o libggml-cuda.so \
    ggml-cuda.cu ggml-cuda/*.cu ggml.c ggml-backend.c ggml-alloc.c ggml-quants.c sgemm.cpp
