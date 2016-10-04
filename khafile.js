let project = new Project('InputThing');

project.addAssets('Assets/**');
project.addSources('Sources');

project.addLibrary('zui');

resolve(project);
