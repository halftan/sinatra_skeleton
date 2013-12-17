module RSpecHelper

  def clean_db
    Dir[File.expand_path '../../../models/*.rb', __FILE__].each do |f|
      col = File.basename f, ".*"
      model = Kernel.const_get col.capitalize
      model.send :destroy_all
   end
  end

end
