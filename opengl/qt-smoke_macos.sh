echo "create main.cpp ..."
if [ "1" ] ; then 
echo '/*'
echo ''
echo '    Qt OpenGL Tutorial - Lesson 02'
echo ''
echo '    main.cpp'
echo '    v 1.00'
echo '    2002/12/05'
echo ''
echo '    Copyright (C) 2002 Cavendish'
echo '                       cavendish@qiliang.net'
echo '                       http://www.qiliang.net/nehe_qt'
echo ''
echo '    This program is free software; you can redistribute it and/or modify'
echo '    it under the terms of the GNU General Public License as published by'
echo '    the Free Software Foundation; either version 2 of the License, or'
echo '    (at your option) any later version.'
echo ''
echo '*/'
echo ''
echo '#include <qapplication.h>'
echo '#include <qmessagebox.h>'
echo '#include <QWidget>'
echo '#include "nehewidget.h"'
echo ''
echo 'int main( int argc, char **argv )'
echo '{'
echo '  bool fs = false;'
echo ''
echo '  QApplication a(argc,argv);'
echo ''
echo '  switch( QMessageBox::information( 0,'
echo '      "Start FullScreen?",'
echo '      "Would You Like To Run In Fullscreen Mode?",'
echo '      QMessageBox::Yes,'
echo '      QMessageBox::No | QMessageBox::Default ) )'
echo '  {'
echo '  case QMessageBox::Yes:'
echo '    fs = true;'
echo '    break;'
echo '  case QMessageBox::No:'
echo '    fs = false;'
echo '    break;'
echo '  }'
echo '  '
echo '  NeHeWidget w( 0, 0, fs );'
echo '//  a.setMainWidget( &w );'
echo '  w.show();'
echo '  '
echo '  return a.exec();'
echo '}'
fi > main.cpp

echo "create nehewidget.cpp ..."
if [ "1" ] ; then 
echo '/*'
echo ''
echo '    Qt OpenGL Tutorial - Lesson 02'
echo ''
echo '    nehewidget.cpp'
echo '    v 1.00'
echo '    2002/12/05'
echo ''
echo '    Copyright (C) 2002 Cavendish'
echo '                       cavendish@qiliang.net'
echo '                       http://www.qiliang.net/nehe_qt'
echo ''
echo '    This program is free software; you can redistribute it and/or modify'
echo '    it under the terms of the GNU General Public License as published by'
echo '    the Free Software Foundation; either version 2 of the License, or'
echo '    (at your option) any later version.'
echo ''
echo '*/'
echo ''
echo '#include "nehewidget.h"'
echo '#include <QKeyEvent>'
echo '#include <QGLWidget>'
echo '#include <QWidget>'
echo 'NeHeWidget::NeHeWidget( QWidget* parent, const char* name, bool fs )'
echo '    : QGLWidget( parent)'
echo '{'
echo '  fullscreen = fs;'
echo '  setGeometry( 0, 0, 640, 480 );'
echo ' // setCaption( "NeHe'"'"'s First Polygon Tutorial" );'
echo ''
echo '  if ( fullscreen )'
echo '    showFullScreen();'
echo '}'
echo ''
echo 'NeHeWidget::~NeHeWidget()'
echo '{'
echo '}'
echo ''
echo 'void NeHeWidget::paintGL()'
echo '{'
echo '  glClear( GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT );'
echo '  glLoadIdentity();'
echo '  '
echo '  glTranslatef( -1.5,  0.0, -6.0 );'
echo '  '
echo '  glBegin( GL_TRIANGLES );'
echo '    glVertex3f(  0.0,  1.0,  0.0 );'
echo '    glVertex3f( -1.0, -1.0,  0.0 );'
echo '    glVertex3f(  1.0, -1.0,  0.0 );'
echo '  glEnd();'
echo '  '
echo '  glTranslatef(  3.0,  0.0,  0.0 );'
echo '  '
echo '  glBegin( GL_QUADS );'
echo '    glVertex3f( -1.0,  1.0,  0.0 );'
echo '    glVertex3f(  1.0,  1.0,  0.0 );'
echo '    glVertex3f(  1.0, -1.0,  0.0 );'
echo '    glVertex3f( -1.0, -1.0,  0.0 );'
echo '  glEnd();'
echo '}'
echo ''
echo 'void NeHeWidget::initializeGL()'
echo '{'
echo '  glShadeModel( GL_SMOOTH );'
echo '  glClearColor( 0.0, 0.0, 0.0, 0.0 );'
echo '  glClearDepth( 1.0 );'
echo '  glEnable( GL_DEPTH_TEST );'
echo '  glDepthFunc( GL_LEQUAL );'
echo '  glHint( GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST );'
echo '}'
echo ''
echo 'void NeHeWidget::resizeGL( int width, int height )'
echo '{'
echo '  if ( height == 0 )'
echo '  {'
echo '    height = 1;'
echo '  }'
echo '  glViewport( 0, 0, (GLint)width, (GLint)height );'
echo '  glMatrixMode( GL_PROJECTION );'
echo '  glLoadIdentity();'
echo '  gluPerspective( 45.0, (GLfloat)width/(GLfloat)height, 0.1, 100.0 );'
echo '  glMatrixMode( GL_MODELVIEW );'
echo '  glLoadIdentity();'
echo '}'
echo ''
echo 'void NeHeWidget::keyPressEvent( QKeyEvent *e )'
echo '{'
echo '  switch ( e->key() )'
echo '  {'
echo '  case Qt::Key_F2:'
echo '    fullscreen = !fullscreen;'
echo '    if ( fullscreen )'
echo '    {'
echo '      showFullScreen();'
echo '    }'
echo '    else'
echo '    {'
echo '      showNormal();'
echo '      setGeometry( 0, 0, 640, 480 );'
echo '    }'
echo '    update();'
echo '    break;'
echo '  case Qt::Key_Escape:'
echo '    close();'
echo '  }'
echo '}'
fi > nehewidget.cpp

echo "create nehewidget.h ..."
if [ "1" ] ; then 
echo '/*'
echo ''
echo '    Qt OpenGL Tutorial - Lesson 02'
echo ''
echo '    nehewidget.h'
echo '    v 1.00'
echo '    2002/12/05'
echo ''
echo '    Copyright (C) 2002 Cavendish'
echo '                       cavendish@qiliang.net'
echo '                       http://www.qiliang.net/nehe_qt'
echo ''
echo '    This program is free software; you can redistribute it and/or modify'
echo '    it under the terms of the GNU General Public License as published by'
echo '    the Free Software Foundation; either version 2 of the License, or'
echo '    (at your option) any later version.'
echo ''
echo '*/'
echo ''
echo '#ifndef NEHEWIDGET_H'
echo '#define NEHEWIDGET_H'
echo ''
echo '#include <qgl.h>'
echo ''
echo 'class NeHeWidget : public QGLWidget'
echo '{'
echo '    Q_OBJECT'
echo ''
echo 'public:'
echo '    '
echo '  NeHeWidget( QWidget* parent = 0, const char* name = 0, bool fs = false );'
echo '  ~NeHeWidget();'
echo ''
echo 'protected:'
echo ''
echo '  void initializeGL();'
echo '  void paintGL();'
echo '  void resizeGL( int width, int height );'
echo ''
echo '  void keyPressEvent( QKeyEvent *e );'
echo ''
echo 'protected:'
echo ''
echo '  bool fullscreen;'
echo ''
echo '};'
echo ''
echo '#endif//NEHEWIDGET_H'
fi > nehewidget.h

echo "create smoke.pro ..."
if [ "1" ] ; then 
echo '#'
echo '#'
echo '#   Qt OpenGL Tutorial - Lesson 02'
echo '#'
echo '#   smoke.pro'
echo '#   v 1.00'
echo '#   2002/12/05'
echo '#'
echo '#   Copyright (C) 2002 Cavendish'
echo '#                      cavendish@qiliang.net'
echo '#                      http://www.qiliang.net/nehe_qt'
echo '#'
echo '#   This program is free software; you can redistribute it and/or modify'
echo '#   it under the terms of the GNU General Public License as published by'
echo '#   the Free Software Foundation; either version 2 of the License, or'
echo '#   (at your option) any later version.'
echo '#'
echo '#'
echo 'TEMPLATE	= app'
echo 'CONFIG		+= qt opengl warn_on release'
echo 'HEADERS		= nehewidget.h'
echo 'SOURCES		= nehewidget.cpp \'
echo '		  main.cpp'
echo 'TARGET		= smoke'
echo 'QT += opengl'
fi > smoke.pro

