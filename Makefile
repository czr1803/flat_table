say_hi:
	@echo "Hi!" $(name)

create_env:
	python -m venv .venv

add_jupyter_kernel:
	(	\
		source .venv/bin/activate; \
		python -m ipykernel install --name flat-table --display-name "Flat Table"; \
		deactivate; \
	)

cleanup:
	@echo "starting to remove cache and build folders.."
	rm -rf __pycache__
	rm -rf .ipynb_checkpoints
	rm -rf **/__pycache__
	rm -rf **/.ipynb_checkpoints
	rm -rf dist
	rm -rf build
	rm -rf dist
	rm -rf *.egg-info
	@echo "done!"

package_it:
	python setup.py sdist bdist_wheel

publish_to_test:
	twine upload -r pypitest dist/*

publish_to_pypi:
	twine upload -r pypi dist/*
