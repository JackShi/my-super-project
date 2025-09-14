import { describe, it, expect, vi, beforeEach } from 'vitest'
import { render, screen, fireEvent, waitFor } from '@testing-library/react'
import userEvent from '@testing-library/user-event'
import App from './App'

// Mock fetch for API calls
global.fetch = vi.fn()

describe('App Component', () => {
  beforeEach(() => {
    // Reset fetch mock before each test
    vi.resetAllMocks()
  })

  it('应该正确渲染主标题和描述', () => {
    render(<App />)
    
    expect(screen.getByText('🚀 超级项目模板')).toBeInTheDocument()
    expect(screen.getByText(/这是一个现代化的全栈项目模板/)).toBeInTheDocument()
  })

  it('应该显示初始计数器值为0', () => {
    render(<App />)
    
    expect(screen.getByText('计数器演示: 0')).toBeInTheDocument()
  })

  it('点击增加按钮应该增加计数器', async () => {
    const user = userEvent.setup()
    render(<App />)
    
    // 使用更灵活的文本匹配 - Ant Design会在文字间插入空格
    const increaseButton = screen.getByRole('button', { name: '增 加' })
    await user.click(increaseButton)
    
    expect(screen.getByText('计数器演示: 1')).toBeInTheDocument()
  })

  it('点击减少按钮应该减少计数器', async () => {
    const user = userEvent.setup()
    render(<App />)
    
    // 先增加到1，再减少
    const increaseButton = screen.getByRole('button', { name: '增 加' })
    const decreaseButton = screen.getByRole('button', { name: '减 少' })
    
    await user.click(increaseButton)
    expect(screen.getByText('计数器演示: 1')).toBeInTheDocument()
    
    await user.click(decreaseButton)
    expect(screen.getByText('计数器演示: 0')).toBeInTheDocument()
  })

  it('点击重置按钮应该重置计数器为0', async () => {
    const user = userEvent.setup()
    render(<App />)
    
    const increaseButton = screen.getByRole('button', { name: '增 加' })
    const resetButton = screen.getByRole('button', { name: '重 置' })
    
    // 增加几次
    await user.click(increaseButton)
    await user.click(increaseButton)
    expect(screen.getByText('计数器演示: 2')).toBeInTheDocument()
    
    // 重置
    await user.click(resetButton)
    expect(screen.getByText('计数器演示: 0')).toBeInTheDocument()
  })

  it('应该显示API测试按钮', () => {
    render(<App />)
    
    expect(screen.getByText('测试后端API连接')).toBeInTheDocument()
  })

  it('点击API测试按钮应该调用API', async () => {
    const mockResponse = { message: 'pong', status: 'ok' }
    ;(global.fetch as any).mockResolvedValueOnce({
      ok: true,
      json: async () => mockResponse,
    })
    
    const consoleSpy = vi.spyOn(console, 'log')
    const user = userEvent.setup()
    render(<App />)
    
    const apiTestButton = screen.getByText('测试后端API连接')
    await user.click(apiTestButton)
    
    await waitFor(() => {
      expect(global.fetch).toHaveBeenCalledWith('/api/ping')
      expect(consoleSpy).toHaveBeenCalledWith('API测试:', mockResponse)
    })
  })

  it('API测试失败时应该输出错误信息', async () => {
    const mockError = new Error('Network error')
    ;(global.fetch as any).mockRejectedValueOnce(mockError)
    
    const consoleErrorSpy = vi.spyOn(console, 'error')
    const user = userEvent.setup()
    render(<App />)
    
    const apiTestButton = screen.getByText('测试后端API连接')
    await user.click(apiTestButton)
    
    await waitFor(() => {
      expect(global.fetch).toHaveBeenCalledWith('/api/ping')
      expect(consoleErrorSpy).toHaveBeenCalledWith('API测试失败:', mockError)
    })
  })

  it('应该有正确的CSS类名结构', () => {
    const { container } = render(<App />)
    
    expect(container.querySelector('.App')).toBeInTheDocument()
    expect(container.querySelector('.max-w-2xl')).toBeInTheDocument()
  })
})