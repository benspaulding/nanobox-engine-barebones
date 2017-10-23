# -*- mode: bash; tab-width: 2; -*-
# vim: ts=2 sw=2 ft=bash noet

# Copy the code into the live directory which will be used to run the app
publish_release() {
  nos_print_bullet "Moving build into live app directory..."
  rsync -a $(nos_code_dir)/ $(nos_app_dir)
}

# set any necessary environment variables
setup_env() {
  nos_template_file \
    "env.d/PATH" \
    "$(nos_etc_dir)/env.d/PATH"
  nos_template_file \
    "env.d/PIP_BUILD" \
    "$(nos_etc_dir)/env.d/PIP_BUILD"
  nos_template_file \
    "env.d/PIP_CACHE" \
    "$(nos_etc_dir)/env.d/PIP_CACHE"
  nos_template_file \
    "env.d/PIP_LOG" \
    "$(nos_etc_dir)/env.d/PIP_LOG"
  nos_template_file \
    "env.d/PIP_PREFIX" \
    "$(nos_etc_dir)/env.d/PIP_PREFIX"
  nos_template_file \
    "env.d/PIP_ROOT" \
    "$(nos_etc_dir)/env.d/PIP_ROOT"
  nos_template_file \
    "env.d/PIP_SRC" \
    "$(nos_etc_dir)/env.d/PIP_SRC"
  nos_template_file \
    "env.d/PYTHONPATH" \
    "$(nos_etc_dir)/env.d/PYTHONPATH"
  # ensure Python doesn't buffer even when not attached to a pty
  nos_template_file \
    "env.d/PYTHONUNBUFFERED" \
    "$(nos_etc_dir)/env.d/PYTHONUNBUFFERED"
  nos_template_file \
    "env.d/WORKON_HOME" \
    "$(nos_etc_dir)/env.d/WORKON_HOME"
  nos_template_file \
    "get-pip.py" \
    "$(nos_data_dir)/bin/get-pip.py"
}


install_pip() {
  nos_run_process "Installing pip, setuptools, and wheel..." \
    "$(nos_data_dir)/bin/get-pip.py"
  cd - >/dev/null
}
