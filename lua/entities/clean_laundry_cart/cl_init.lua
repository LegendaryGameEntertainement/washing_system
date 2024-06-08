include("shared.lua")

function ENT:Draw()
  self:DrawModel()

  local pos = self:LocalToWorld(self:OBBCenter())
  local ang = self:GetAngles()

  local phrase = string.gsub(LaundryConfig.PhraseCleanClothes, "<clothes>", self:GetClothesNumber())

  cam.Start3D2D(pos + (ang:Up() * 18) + (ang:Right() * 0), ang + Angle(0,90,90), 0.25)
    draw.SimpleText(tostring(phrase), "DermaLarge", 0, 0, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
  cam.End3D2D()
end
