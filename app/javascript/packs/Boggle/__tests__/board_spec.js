import { mount } from '@vue/test-utils'
import Board from '../../Boggle/Default.vue'

describe('Default', () => {
  test('renders correctly', () => {
    const wrapper = mount(Board)
    expect(wrapper.element).toMatchSnapshot()
  })
})
