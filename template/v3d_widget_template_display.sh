echo 'CLASS QDialog TestDialog'
echo ''
echo 'D QLabel label_subject "Subject Image :"'
echo 'D QComboBox combo_subject | addItems(items)'
echo ''
echo 'D QLabel label_target "Target Image :"'
echo 'D QComboBox combo_target | addItems(items)'
echo ''
echo 'D QLabel label_sub_channel "Subject Channel :"'
echo 'D QLabel label_tar_channel "Target Channel :"'
echo ''
echo 'D QSpinBox channel_sub | setMaximum(3) setValue(0)'
echo 'D QSpinBox channel_tar | setMaximum(3) setValue(0)'
echo ''
echo 'D QPushButton ok "ok"'
echo 'D QPushButton cancel "cancel"'
echo ''
echo 'D QGridLayout gridLayout'
echo 'L 0 0 label_subject'
echo 'L 0 1 combo_subject 1 5'
echo 'L 1 0 label_sub_channel'
echo 'L 1 1 channel_sub 1 1'
echo 'L 2 0 label_target'
echo 'L 2 1 combo_target 1 5'
echo 'L 3 0 label_tar_channel'
echo 'L 3 1 channel_tar'
echo 'L 5 4 cancel Qt::AlignRight'
echo 'L 5 5 ok     Qt::AlignRight'
echo ''
echo 'C ok clicked() this accept()'
echo 'C cancel clicked() this reject()'
echo ''
echo 'C combo_subject currentIndexChanged(int) this update()'
echo 'C combo_target currentIndexChanged(int) this update()'
echo ''
echo 'C channel_sub valueChanged(int) this update()'
echo 'C channel_tar valueChanged(int) this update()'
echo ''
echo 'R this | setLayout(gridLayout)'
echo 'R this | setWindowTitle("Test Widget")'
echo ''
echo 'U int i1 | combo_subject->currentIndex()'
echo 'U int i2 | combo_target->currentIndex()'
echo 'U int c1 | channel_sub->text().toInt()'
echo 'U int c2 | channel_tar->text().toInt()'
echo '================================================='
echo 'CLASS QWidget TestWidget'
echo ''
echo 'D QLabel label_subject "Subject Image :"'
echo 'D QComboBox combo_subject '
echo ''
echo 'D QLabel label_target "Target Image :"'
echo 'D QComboBox combo_target '
echo ''
echo 'D QLabel label_sub_channel "Subject Channel :"'
echo 'D QLabel label_tar_channel "Target Channel :"'
echo ''
echo 'D QSpinBox channel_sub'
echo 'D QSpinBox channel_tar'
echo ''
echo 'D QPushButton ok "ok"'
echo 'D QPushButton cancel "cancel"'
echo ''
echo 'D QVBoxLayout gridLayout'
echo ''
echo 'L 0 0 label_subject'
echo 'L 0 1 combo_subject 1 5'
echo 'L 1 0 label_sub_channel'
echo 'L 1 1 channel_sub 1 1'
echo 'L 2 0 label_target'
echo 'L 2 1 combo_target 1 5'
echo 'L 3 0 label_tar_channel'
echo 'L 3 1 channel_tar'
echo 'L 5 4 cancel Qt::AlignRight'
echo 'L 5 5 ok     Qt::AlignRight'
echo ''
echo 'C ok clicked() this accept()'
echo 'C cancel clicked() this reject()'
echo ''
echo 'C combo_subject currentIndexChanged(int) this onSubjectChanged()'
echo 'C combo_target currentIndexChanged(int) this onTargetChanged()'
echo ''
echo 'C channel_sub valueChanged(int) this onChannelChanged()'
echo 'C channel_tar valueChanged(int) this onChannelChanged()'
