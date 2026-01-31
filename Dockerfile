FROM python:3.8-slim

# 1. System Dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libgl1-mesa-glx \
    libglib2.0-0 \
    xxd \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /work

# 2. Pin Pip to the "Legacy-Friendly" version
RUN pip install --no-cache-dir pip==23.3.2 setuptools wheel

# 3. Layer 1: Install the Legacy ML Stack with STRICT NumPy pinning
# We pin numpy<1.20 to prevent the 'np.object' AttributeError
RUN pip install --no-cache-dir \
    numpy==1.19.5 \
    tensorflow==2.4.0 \
    h5py==2.10.0 \
    protobuf==3.19.6

# 4. Layer 2: Force Reinstall UI/Jupyter Stack (Fixes 'Self' error)
RUN pip install --no-cache-dir --upgrade --force-reinstall \
    typing-extensions==4.5.0 \
    traitlets==5.9.0 \
    notebook==6.4.12 \
    jupyter-server==1.13.5

# 5. Layer 3: Data Tools (Careful not to upgrade numpy)
# We use --no-deps or explicit pins if necessary, but pip 23.3 is usually smart here
RUN pip install --no-cache-dir \
    pandas==1.4.4 \
    matplotlib==3.5.3 \
    opencv-python-headless

# 6. Run as Root
EXPOSE 8888
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root", "--notebook-dir=/work"]
