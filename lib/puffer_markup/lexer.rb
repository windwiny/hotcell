
# line 1 "lib/puffer_markup/lexer.rl"

# line 84 "lib/puffer_markup/lexer.rl"

#%

module PufferMarkup
  class Lexer
    OPERATORS = {
      '+' => :PLUS, '-' => :MINUS, '*' => :MULTIPLY, '**' => :POWER, '/' => :DIVIDE,

      '&&' => :AND, '||' => :OR, '!' => :NOT, '==' => :EQUAL, '!=' => :INEQUAL,
      '>' => :GT, '>=' => :GTE, '<' => :LT, '<=' => :LTE,

      '=' => :ASSIGN, ',' => :COMMA, '.' => :PERIOD, ':' => :COLON, ';' => :SEMICOLON, "\n" => :NEWLINE,

      '[' => :AOPEN, ']' => :ACLOSE, '{' => :HOPEN, '}' => :HCLOSE,
      '(' => :BOPEN, ')' => :BCLOSE
    }

    CONSTANTS = {
      'nil' => [:NIL, nil], 'null' => [:NIL, nil],
      'false' => [:FALSE, false], 'true' => [:TRUE, true]
    }

    SSTRING_ESCAPE_REGEXP = /\\\'|\\\\/
    SSTRING_ESCAPE_MAP = { "\\'" => "'", "\\\\" => "\\" }

    DSTRING_ESCAPE_REGEXP = /\\./
    DSTRING_ESCAPE_MAP = {
      '\\"' => '"', "\\\\" => "\\", '\n' => "\n",
      '\s' => "\s", '\r' => "\r", '\t' => "\t"
    }

    TAGS = {
      '{{' => :TOPEN, '{{!' => :TOPEN,
      '{{/' => :TOPEN, '}}' => :TCLOSE
    }

    PREREGEXP = Set.new [
      :TOPEN, :NEWLINE, :SEMICOLON,
      :COLON, :COMMA, :PERIOD,
      :BOPEN, :AOPEN, :HOPEN
    ]

    def initialize source
      @source = source
      @data = @source.unpack 'c*'

      
# line 53 "lib/puffer_markup/lexer.rb"
class << self
	attr_accessor :_puffer_lexer_actions
	private :_puffer_lexer_actions, :_puffer_lexer_actions=
end
self._puffer_lexer_actions = [
	0, 1, 0, 1, 1, 1, 3, 1, 
	4, 1, 5, 1, 8, 1, 9, 1, 
	10, 1, 11, 1, 12, 1, 13, 1, 
	14, 1, 15, 1, 16, 1, 17, 1, 
	18, 1, 19, 1, 20, 1, 21, 1, 
	22, 1, 23, 2, 5, 2, 2, 5, 
	6, 2, 5, 7
]

class << self
	attr_accessor :_puffer_lexer_key_offsets
	private :_puffer_lexer_key_offsets, :_puffer_lexer_key_offsets=
end
self._puffer_lexer_key_offsets = [
	0, 0, 2, 2, 3, 5, 5, 7, 
	7, 9, 10, 11, 12, 13, 15, 44, 
	45, 46, 48, 50, 54, 57, 66
]

class << self
	attr_accessor :_puffer_lexer_trans_keys
	private :_puffer_lexer_trans_keys, :_puffer_lexer_trans_keys=
end
self._puffer_lexer_trans_keys = [
	34, 92, 38, 39, 92, 47, 92, 48, 
	57, 124, 123, 123, 123, 33, 47, 10, 
	32, 33, 34, 38, 39, 42, 46, 47, 
	91, 93, 95, 123, 124, 125, 9, 13, 
	40, 45, 48, 57, 58, 59, 60, 62, 
	65, 90, 97, 122, 61, 42, 48, 57, 
	47, 92, 65, 90, 97, 122, 46, 48, 
	57, 33, 63, 95, 48, 57, 65, 90, 
	97, 122, 125, 0
]

class << self
	attr_accessor :_puffer_lexer_single_lengths
	private :_puffer_lexer_single_lengths, :_puffer_lexer_single_lengths=
end
self._puffer_lexer_single_lengths = [
	0, 2, 0, 1, 2, 0, 2, 0, 
	0, 1, 1, 1, 1, 2, 15, 1, 
	1, 0, 2, 0, 1, 3, 1
]

class << self
	attr_accessor :_puffer_lexer_range_lengths
	private :_puffer_lexer_range_lengths, :_puffer_lexer_range_lengths=
end
self._puffer_lexer_range_lengths = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	1, 0, 0, 0, 0, 0, 7, 0, 
	0, 1, 0, 2, 1, 3, 0
]

class << self
	attr_accessor :_puffer_lexer_index_offsets
	private :_puffer_lexer_index_offsets, :_puffer_lexer_index_offsets=
end
self._puffer_lexer_index_offsets = [
	0, 0, 3, 4, 6, 9, 10, 13, 
	14, 16, 18, 20, 22, 24, 27, 50, 
	52, 54, 56, 59, 62, 65, 72
]

class << self
	attr_accessor :_puffer_lexer_trans_targs
	private :_puffer_lexer_trans_targs, :_puffer_lexer_trans_targs=
end
self._puffer_lexer_trans_targs = [
	14, 2, 1, 1, 14, 0, 14, 5, 
	4, 4, 19, 7, 6, 6, 17, 14, 
	14, 0, 12, 11, 10, 11, 13, 10, 
	10, 10, 10, 14, 14, 15, 1, 3, 
	4, 16, 17, 18, 14, 14, 21, 14, 
	9, 22, 14, 14, 20, 14, 15, 21, 
	21, 0, 14, 14, 14, 14, 17, 14, 
	19, 7, 6, 19, 19, 14, 8, 20, 
	14, 14, 14, 21, 21, 21, 21, 14, 
	14, 14, 14, 14, 14, 10, 10, 10, 
	14, 14, 14, 14, 14, 14, 14, 14, 
	0
]

class << self
	attr_accessor :_puffer_lexer_trans_actions
	private :_puffer_lexer_trans_actions, :_puffer_lexer_trans_actions=
end
self._puffer_lexer_trans_actions = [
	19, 0, 0, 0, 13, 0, 17, 0, 
	0, 0, 0, 0, 0, 0, 49, 33, 
	13, 0, 0, 0, 41, 0, 0, 41, 
	37, 37, 39, 13, 21, 0, 0, 0, 
	0, 0, 46, 43, 13, 13, 0, 13, 
	0, 0, 21, 13, 9, 13, 0, 0, 
	0, 0, 13, 23, 13, 23, 49, 35, 
	0, 0, 0, 0, 0, 29, 0, 9, 
	25, 15, 15, 0, 0, 0, 0, 27, 
	11, 23, 31, 31, 33, 41, 41, 39, 
	23, 23, 35, 23, 29, 25, 27, 23, 
	0
]

class << self
	attr_accessor :_puffer_lexer_to_state_actions
	private :_puffer_lexer_to_state_actions, :_puffer_lexer_to_state_actions=
end
self._puffer_lexer_to_state_actions = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 5, 0, 0, 0, 5, 0, 
	0, 0, 0, 0, 0, 0, 0
]

class << self
	attr_accessor :_puffer_lexer_from_state_actions
	private :_puffer_lexer_from_state_actions, :_puffer_lexer_from_state_actions=
end
self._puffer_lexer_from_state_actions = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 7, 0, 0, 0, 7, 0, 
	0, 0, 0, 0, 0, 0, 0
]

class << self
	attr_accessor :_puffer_lexer_eof_actions
	private :_puffer_lexer_eof_actions, :_puffer_lexer_eof_actions=
end
self._puffer_lexer_eof_actions = [
	0, 3, 0, 0, 1, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0
]

class << self
	attr_accessor :_puffer_lexer_eof_trans
	private :_puffer_lexer_eof_trans, :_puffer_lexer_eof_trans=
end
self._puffer_lexer_eof_trans = [
	0, 0, 0, 0, 0, 0, 76, 76, 
	77, 0, 0, 79, 79, 80, 0, 88, 
	88, 83, 88, 85, 86, 87, 88
]

class << self
	attr_accessor :puffer_lexer_start
end
self.puffer_lexer_start = 10;
class << self
	attr_accessor :puffer_lexer_first_final
end
self.puffer_lexer_first_final = 10;
class << self
	attr_accessor :puffer_lexer_error
end
self.puffer_lexer_error = 0;

class << self
	attr_accessor :puffer_lexer_en_expression
end
self.puffer_lexer_en_expression = 14;
class << self
	attr_accessor :puffer_lexer_en_main
end
self.puffer_lexer_en_main = 10;


# line 131 "lib/puffer_markup/lexer.rl"
      #%
    end

    def emit symbol, value
      @token_array << [symbol, value]
    end

    def current_value
      @data[@ts...@te].pack('c*').force_encoding('UTF-8')
    end

    def emit_operator
      value = current_value
      emit OPERATORS[value], value
    end

    def emit_numeric
      value = current_value
      if value =~ /\./
        emit :FLOAT, Float(value)
      else
        emit :INTEGER, Integer(value)
      end
    end

    def emit_identifer
      value = current_value
      if args = CONSTANTS[value]
        emit *args
      else
        emit :IDENTIFER, value
      end
    end

    def emit_sstring
      emit :STRING, current_value[1..-2].gsub(SSTRING_ESCAPE_REGEXP) { |match|
        SSTRING_ESCAPE_MAP[match] }.force_encoding('UTF-8')
    end

    def emit_dstring
      emit :STRING, current_value[1..-2].gsub(DSTRING_ESCAPE_REGEXP) { |match|
        DSTRING_ESCAPE_MAP[match] || match[1] }
    end

    def regexp_ambiguity
      unless regexp_possible?
        emit_operator
        yield
      end
    end

    def regexp_possible?
      last = @token_array[-1]
      # Need more rules!
      !last || PREREGEXP.include?(last[0])
    end

    def emit_regexp
      value = current_value
      finish = value.rindex('/')

      options_string = value[finish+1..-1]
      options = 0
      options |= Regexp::EXTENDED if options_string.include?('x')
      options |= Regexp::IGNORECASE if options_string.include?('i')
      options |= Regexp::MULTILINE if options_string.include?('m')

      emit :REGEXP, Regexp.new(value[1..finish-1], options)
    end

    def emit_template
      # Hack this to glue templates going straight
      if @token_array[-1] && @token_array[-1][0] == :TEMPLATE
        @token_array[-1][1] += current_value
      else
        emit :TEMPLATE, current_value
      end
    end

    def emit_tag
      value = current_value
      emit TAGS[value], value
    end

    def current_position
      parsed = @data[0..@ts].pack('c*').force_encoding('UTF-8')
      line = parsed.count("\n") + 1
      column = parsed.size  - 1 - (parsed.rindex("\n") || -1)
      [line, column]
    end

    def raise_unexpected_symbol
      raise PufferMarkup::Errors::UnexpectedSymbol.new *current_position
    end

    def raise_unterminated_string
      raise PufferMarkup::Errors::UnterminatedString.new *current_position
    end

    def raise_unterminated_regexp
      raise PufferMarkup::Errors::UnterminatedRegexp.new *current_position
    end

    def tokens
      @tokens ||= tokenize
    end

    def tokenize
      @token_array = []

      
# line 337 "lib/puffer_markup/lexer.rb"
begin
	p ||= 0
	pe ||=  @data.length
	cs = puffer_lexer_start
	top = 0
	 @ts = nil
	 @te = nil
	act = 0
end

# line 242 "lib/puffer_markup/lexer.rl"
      #%

      eof = pe
      stack = []

      
# line 355 "lib/puffer_markup/lexer.rb"
begin
	_klen, _trans, _keys, _acts, _nacts = nil
	_goto_level = 0
	_resume = 10
	_eof_trans = 15
	_again = 20
	_test_eof = 30
	_out = 40
	while true
	_trigger_goto = false
	if _goto_level <= 0
	if p == pe
		_goto_level = _test_eof
		next
	end
	if cs == 0
		_goto_level = _out
		next
	end
	end
	if _goto_level <= _resume
	_acts = _puffer_lexer_from_state_actions[cs]
	_nacts = _puffer_lexer_actions[_acts]
	_acts += 1
	while _nacts > 0
		_nacts -= 1
		_acts += 1
		case _puffer_lexer_actions[_acts - 1]
			when 4 then
# line 1 "NONE"
		begin
 @ts = p
		end
# line 389 "lib/puffer_markup/lexer.rb"
		end # from state action switch
	end
	if _trigger_goto
		next
	end
	_keys = _puffer_lexer_key_offsets[cs]
	_trans = _puffer_lexer_index_offsets[cs]
	_klen = _puffer_lexer_single_lengths[cs]
	_break_match = false
	
	begin
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + _klen - 1

	     loop do
	        break if _upper < _lower
	        _mid = _lower + ( (_upper - _lower) >> 1 )

	        if  @data[p].ord < _puffer_lexer_trans_keys[_mid]
	           _upper = _mid - 1
	        elsif  @data[p].ord > _puffer_lexer_trans_keys[_mid]
	           _lower = _mid + 1
	        else
	           _trans += (_mid - _keys)
	           _break_match = true
	           break
	        end
	     end # loop
	     break if _break_match
	     _keys += _klen
	     _trans += _klen
	  end
	  _klen = _puffer_lexer_range_lengths[cs]
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + (_klen << 1) - 2
	     loop do
	        break if _upper < _lower
	        _mid = _lower + (((_upper-_lower) >> 1) & ~1)
	        if  @data[p].ord < _puffer_lexer_trans_keys[_mid]
	          _upper = _mid - 2
	        elsif  @data[p].ord > _puffer_lexer_trans_keys[_mid+1]
	          _lower = _mid + 2
	        else
	          _trans += ((_mid - _keys) >> 1)
	          _break_match = true
	          break
	        end
	     end # loop
	     break if _break_match
	     _trans += _klen
	  end
	end while false
	end
	if _goto_level <= _eof_trans
	cs = _puffer_lexer_trans_targs[_trans]
	if _puffer_lexer_trans_actions[_trans] != 0
		_acts = _puffer_lexer_trans_actions[_trans]
		_nacts = _puffer_lexer_actions[_acts]
		_acts += 1
		while _nacts > 0
			_nacts -= 1
			_acts += 1
			case _puffer_lexer_actions[_acts - 1]
when 2 then
# line 56 "lib/puffer_markup/lexer.rl"
		begin
 regexp_ambiguity { 	begin
		cs = 14
		_trigger_goto = true
		_goto_level = _again
		break
	end
 } 		end
when 5 then
# line 1 "NONE"
		begin
 @te = p+1
		end
when 6 then
# line 71 "lib/puffer_markup/lexer.rl"
		begin
act = 2;		end
when 7 then
# line 72 "lib/puffer_markup/lexer.rl"
		begin
act = 3;		end
when 8 then
# line 70 "lib/puffer_markup/lexer.rl"
		begin
 @te = p+1
 begin  emit_tag; 	begin
		top -= 1
		cs = stack[top]
		_trigger_goto = true
		_goto_level = _again
		break
	end
  end
		end
when 9 then
# line 71 "lib/puffer_markup/lexer.rl"
		begin
 @te = p+1
 begin  emit_operator  end
		end
when 10 then
# line 73 "lib/puffer_markup/lexer.rl"
		begin
 @te = p+1
 begin  emit_identifer  end
		end
when 11 then
# line 74 "lib/puffer_markup/lexer.rl"
		begin
 @te = p+1
 begin  emit_sstring  end
		end
when 12 then
# line 75 "lib/puffer_markup/lexer.rl"
		begin
 @te = p+1
 begin  emit_dstring  end
		end
when 13 then
# line 77 "lib/puffer_markup/lexer.rl"
		begin
 @te = p+1
		end
when 14 then
# line 71 "lib/puffer_markup/lexer.rl"
		begin
 @te = p
p = p - 1; begin  emit_operator  end
		end
when 15 then
# line 72 "lib/puffer_markup/lexer.rl"
		begin
 @te = p
p = p - 1; begin  emit_numeric  end
		end
when 16 then
# line 73 "lib/puffer_markup/lexer.rl"
		begin
 @te = p
p = p - 1; begin  emit_identifer  end
		end
when 17 then
# line 76 "lib/puffer_markup/lexer.rl"
		begin
 @te = p
p = p - 1; begin  emit_regexp  end
		end
when 18 then
# line 71 "lib/puffer_markup/lexer.rl"
		begin
 begin p = (( @te))-1; end
 begin  emit_operator  end
		end
when 19 then
# line 72 "lib/puffer_markup/lexer.rl"
		begin
 begin p = (( @te))-1; end
 begin  emit_numeric  end
		end
when 20 then
# line 1 "NONE"
		begin
	case act
	when 2 then
	begin begin p = (( @te))-1; end
 emit_operator end
	when 3 then
	begin begin p = (( @te))-1; end
 emit_numeric end
end 
			end
when 21 then
# line 81 "lib/puffer_markup/lexer.rl"
		begin
 @te = p+1
 begin  emit_tag; 	begin
		stack[top] = cs
		top+= 1
		cs = 14
		_trigger_goto = true
		_goto_level = _again
		break
	end
  end
		end
when 22 then
# line 81 "lib/puffer_markup/lexer.rl"
		begin
 @te = p
p = p - 1; begin  emit_tag; 	begin
		stack[top] = cs
		top+= 1
		cs = 14
		_trigger_goto = true
		_goto_level = _again
		break
	end
  end
		end
when 23 then
# line 82 "lib/puffer_markup/lexer.rl"
		begin
 @te = p
p = p - 1; begin  emit_template  end
		end
# line 602 "lib/puffer_markup/lexer.rb"
			end # action switch
		end
	end
	if _trigger_goto
		next
	end
	end
	if _goto_level <= _again
	_acts = _puffer_lexer_to_state_actions[cs]
	_nacts = _puffer_lexer_actions[_acts]
	_acts += 1
	while _nacts > 0
		_nacts -= 1
		_acts += 1
		case _puffer_lexer_actions[_acts - 1]
when 3 then
# line 1 "NONE"
		begin
 @ts = nil;		end
# line 622 "lib/puffer_markup/lexer.rb"
		end # to state action switch
	end
	if _trigger_goto
		next
	end
	if cs == 0
		_goto_level = _out
		next
	end
	p += 1
	if p != pe
		_goto_level = _resume
		next
	end
	end
	if _goto_level <= _test_eof
	if p == eof
	if _puffer_lexer_eof_trans[cs] > 0
		_trans = _puffer_lexer_eof_trans[cs] - 1;
		_goto_level = _eof_trans
		next;
	end
	__acts = _puffer_lexer_eof_actions[cs]
	__nacts =  _puffer_lexer_actions[__acts]
	__acts += 1
	while __nacts > 0
		__nacts -= 1
		__acts += 1
		case _puffer_lexer_actions[__acts - 1]
when 0 then
# line 48 "lib/puffer_markup/lexer.rl"
		begin
 raise_unterminated_string 		end
when 1 then
# line 52 "lib/puffer_markup/lexer.rl"
		begin
 raise_unterminated_string 		end
# line 660 "lib/puffer_markup/lexer.rb"
		end # eof action switch
	end
	if _trigger_goto
		next
	end
end
	end
	if _goto_level <= _out
		break
	end
	end
	end

# line 248 "lib/puffer_markup/lexer.rl"
      #%

      raise_unexpected_symbol unless @ts.nil?

      @token_array
    end
  end
end