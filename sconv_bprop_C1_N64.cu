extern "C" __global__ __launch_bounds__(32) void sconv_bprop_C1_N64(
  float *param_test,
  float *param_I,
  const float *param_E,
  const float *param_F,
  float param_alpha,   
  float param_N,
  float param_K,            
  float param_D,            
  float param_H,            
  float param_W,            
  float param_WN,          
  float param_HWN,          
  float param_DHWN,         
  float param_C,            
  float param_CRST,         
  float param_RST,          
  float param_magic_RST,    
  float param_shift_RST,    
  float param_RS,           
  float param_magic_RS,     
  float param_shift_RS,     
  float param_S,            
  float param_magic_S,      
  float param_shift_S,      
  float param_pad_d,        
  float param_pad_h,        
  float param_pad_w,        
  float param_str_d,        
  float param_str_h,        
  float param_str_w,        
  float param_Q,            
  float param_PQ,           
  float param_QN,           
  float param_PQN,          
  float param_MPQN,         
  float param_magic_Q,      
  float param_shift_Q,      
  float param_magic_PQ,     
  float param_shift_PQ,     
  float param_CRST8,        
  float param_MPQN8) {
  __shared__ float share[64 * 8 * 2 + 32 * 8 * 2 + 8];
  int tid = threadIdx.x;
  share[tid] = 1;
}