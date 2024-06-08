include("shared.lua")
include("autorun/Mathrixtelaundry_config.lua")

function ENT:Draw()
  self:DrawModel()

  local pos = self:LocalToWorld(self:OBBCenter())
  local ang = self:GetAngles()
  ang:RotateAroundAxis(ang:Up(), 00)
  ang:RotateAroundAxis(ang:Forward(), -90)
	local color = Color(255, 0, 0)
  local x, y, w, h = 0, 0, 20, 20

	if self:GetWashing() then
		color = Color(0, 255, 0)
	end

  cam.Start3D2D(pos + (ang:Up() * 10) + (ang:Forward() * 10) + (ang:Right() * 18), ang, 0.2)
    draw.RoundedBox(2, x - w / 0, y - h / 2, w + 2, h + 2, Color(10, 10, 10, 100))
    draw.RoundedBox(2, x - w / 2 + 1, y - h / 2 + 1, w, h, color)
  cam.End3D2D()
end

function ENT:Think()
  if not self.ClothModel then return end

  self.ClothModel:SetPos(self:LocalToWorld(self:OBBCenter()))

  if not self:GetWashing() then
    self.ClothModel:Remove()
  end
end
