import { mount } from '@vue/test-utils'
import Default from '../../Boggle/Default.vue'

describe('Default', () => {
  test('renders correctly', () => {
    const wrapper = mount(Default)
    expect(wrapper.element).toMatchSnapshot()
  })
})
