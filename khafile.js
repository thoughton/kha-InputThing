let project = new Project('Input Thing');

project.addAssets('Assets/**');
project.addSources('Sources');

project.addLibrary('zui');

resolve(project);
