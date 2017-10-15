# -*- mode: bash; tab-width: 2; -*-
# vim: ts=2 sw=2 ft=bash noet

# Copy the code into the live directory which will be used to run the app
publish_release() {
  nos_print_bullet "Moving build into live app directory..."
  rsync -a $(nos_code_dir)/ $(nos_app_dir)
}

# set any necessary environment variables
setup_env() {
  # ensure Python doesn't buffer even when not attached to a pty
  nos_template_file \
    "env.d/PYTHONUNBUFFERED" \
    "$(nos_etc_dir)/env.d/PYTHONUNBUFFERED"
}
