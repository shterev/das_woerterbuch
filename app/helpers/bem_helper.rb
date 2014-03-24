module BemHelper

  def bem_class_for(block, modifiers=[])
    klass = [block]

    modifiers.each do |modifier|
      klass << "#{block}_#{modifier}"
    end

    klass.join(' ')
  end

end