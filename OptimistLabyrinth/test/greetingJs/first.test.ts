import greetingJs from '../../src/greetingJs'

describe('print hello', () => {
  test('print hello with abcd', () => {
    const greetingMessage = greetingJs.run('abcd')
    expect(greetingMessage).toBe('(javascript) hello abcd')
  })
})
