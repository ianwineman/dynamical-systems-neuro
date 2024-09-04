### A Pluto.jl notebook ###
# v0.19.45

using Markdown
using InteractiveUtils

# ╔═╡ a7f1f63e-6580-11ef-2441-9d653a53d4b4
using Plots, LaTeXStrings

# ╔═╡ fc3eb03c-2093-4db8-a5f6-58e6d4f9e7c4
function αh(v::Float64)
	return 0.07 * exp(-v / 20.0)
end

# ╔═╡ d1633a53-f918-480e-9ff3-2238bff286b0
function βh(v::Float64)
	return 1 / (exp((30.0 - v) / 10.0) + 1.0)
end

# ╔═╡ a9ef6d8b-6dd5-4ec9-9b2b-a74e1934eed3
function h∞(v::Float64)
	return αh(v) / (αh(v) + βh(v))
end

# ╔═╡ 28bc5b96-6c6d-40d6-915d-56ab146f08e1
function αn(v::Float64)
	return (0.01 * (10.0 - v)) / (exp((10.0 - v) / 10.0) - 1.0)
end

# ╔═╡ 59d2e696-f4ae-4363-9093-f75ed25675ae
function βn(v::Float64)
	return 0.125 * exp(-v / 80.0)
end

# ╔═╡ 8f23113f-f509-45f3-8694-625d46d6d94c
function n∞(v::Float64)
	return αn(v) / (αn(v) + βn(v))
end

# ╔═╡ 9d2edadc-fc86-47be-9f91-24127223a459
function αm(v::Float64)
	return (0.1 * (25.0 - v)) / (exp((25.0 - v) / 10.0) - 1.0)
end

# ╔═╡ 322baa91-5682-4766-8199-bd2621569ee8
function βm(v::Float64)
	return 4.0 * exp(-v / 18.0)
end

# ╔═╡ 61b3851e-beed-4faf-a513-1505c48f94c3
function m∞(v::Float64)
	return αm(v) / (αm(v) + βm(v))
end

# ╔═╡ bdc09e93-bec0-4edf-8112-ccbedad8a5a6
function τh(v::Float64)
	return 1.0  / (αh(v) + βh(v))
end

# ╔═╡ 1e6375b6-0ccf-4789-b5e8-48cfc5622648
function τn(v::Float64)
	return 1.0  / (αn(v) + βn(v))
end

# ╔═╡ 50e52bc2-42cb-4698-81db-86ee5860f2fc
function τm(v::Float64)
	return 1.0  / (αm(v) + βm(v))
end

# ╔═╡ 42be9015-6597-4af9-b7e4-2ee1a281a0d5
begin
	xs = collect(-40:0.1:100)
	
	h∞_ys = h∞.(xs)
	n∞_ys = n∞.(xs)
	m∞_ys = m∞.(xs)

	p1 = plot(
		xs, 
		[h∞_ys, n∞_ys, m∞_ys], 
		label=[L"$h_∞(V)$" L"$n_∞(V)$" L"$m_∞(V)$"],
		legend=:outertop,
		legendcolumns=3,
		xlabel=L"Membrane Potential $(mV)$",
		xguidefontsize=10
	)

	τh_ys = τh.(xs)
	τn_ys = τn.(xs)
	τm_ys = τm.(xs)
	
	p2 = plot(
		xs, 
		[τh_ys, τn_ys, τm_ys], 
		label=[L"τ_h(V)" L"τ_n(V)" L"τ_m(V)"],
		legend=:outertop,
		legendcolumns=3,
		xlabel=L"Membrane Potential $(mV)$",
		xguidefontsize=10
	)

	plot(p1, p2, layout=(1,2), size=(800,400))
end

# ╔═╡ c56d0c46-df93-4e85-8d2b-2fd4efa97566
savefig("fig2_13.png")

# ╔═╡ Cell order:
# ╠═a7f1f63e-6580-11ef-2441-9d653a53d4b4
# ╠═fc3eb03c-2093-4db8-a5f6-58e6d4f9e7c4
# ╠═d1633a53-f918-480e-9ff3-2238bff286b0
# ╠═a9ef6d8b-6dd5-4ec9-9b2b-a74e1934eed3
# ╠═28bc5b96-6c6d-40d6-915d-56ab146f08e1
# ╠═59d2e696-f4ae-4363-9093-f75ed25675ae
# ╠═8f23113f-f509-45f3-8694-625d46d6d94c
# ╠═9d2edadc-fc86-47be-9f91-24127223a459
# ╠═322baa91-5682-4766-8199-bd2621569ee8
# ╠═61b3851e-beed-4faf-a513-1505c48f94c3
# ╠═bdc09e93-bec0-4edf-8112-ccbedad8a5a6
# ╠═1e6375b6-0ccf-4789-b5e8-48cfc5622648
# ╠═50e52bc2-42cb-4698-81db-86ee5860f2fc
# ╠═42be9015-6597-4af9-b7e4-2ee1a281a0d5
# ╠═c56d0c46-df93-4e85-8d2b-2fd4efa97566
