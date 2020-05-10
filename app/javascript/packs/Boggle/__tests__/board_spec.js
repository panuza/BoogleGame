import { mount } from '@vue/test-utils'
import Board from '../../Boggle/Board.vue'

describe('Board', () => {
  test('renders correctly', () => {
    const wrapper = mount(Board)
      wrapper.vm.boggle = ["censt"]

      wrapper.vm.user_name = "";
      wrapper.vm.diceGrid = "";
      wrapper.vm.allButton = '';
      wrapper.vm.enteredWord = [];
      wrapper.vm.newWord = '';
      wrapper.vm.words_array = [];
      wrapper.vm.totalScore = 0;
      wrapper.vm.clicked = false;
      wrapper.vm.active = false;
      wrapper.vm.prevElementRow = '';
      wrapper.vm.prevElementCol = '';
      wrapper.vm.timeLeft = 60 * 3;
      wrapper.vm.start = Date.now();

    expect(wrapper.element).toMatchSnapshot()
  })
})
