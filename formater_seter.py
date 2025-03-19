
"""
Hjelpefunksjon som sorterer setene etter radnummer og setebokstav.
"""
def sorter_seter(seter: list):
    
    sorterte_seter = [(int(sete[:-1]), sete[-1]) for sete in seter]
    sorterte_seter.sort()
    sorterte_seter = [f"{sete[0]}{sete[1]}" for sete in sorterte_seter]

    return sorterte_seter


# Tester at funksjonen fungerer som forventet
if __name__ == "__main__":
    seter = ['10A', '10B', '10C', '10D', '10E', '10F', '11A', '11B', '11C', '11D', '11E', '11F', '12A', '12B', '12C', '12D', '12E', '12F', '13A', '13B', '13C', '13D', '13E', '13F', '14A', '14B', '14C', '14D', '14E', '14F', '15A', '15B', '15C', '15D', '15E', '15F', '16A', '16B', '16C', '16D', '16E', '16F', '17A', '17B', '17C', '17D', '17E', '17F', '18A', '18B', '18C', '18D', '18E', '18F', '19A', '19B', '19C', '19D', '19E', '19F', '1A', '1B', '1C', '1D', '1E', '1F', '20A', '20B', '20C', '20D', '20E', '20F', '21A', '21B', '21C', '21D', '21E', '21F', '22A', '22B', '22C', '22D', '22E', '22F', '23A', '23B', '23C', '23D', '23E', '23F', '24A', '24B', '24C', '24D', '24E', '24F', '25A', '25B', '25C', '25D', '25E', '25F', '26A', '26B', '26C', '26D', '26E', '26F', '27A', '27B', '27C', '27D', '27E', '27F', '28A', '28B', '28C', '28D', '28E', '28F', '29A', '29B', '29C', '29D', '29E', '29F', '2A', '2B', '2C', '2D', '2E', '2F', '30A', '30B', '30C', '30D', '30E', '30F', '3A', '3B', '3C', '3D', '3E', '3F', '4A', '4B', '4C', '4D', '4E', '4F', '5A', '5B', '5C', '5D', '5E', '5F', '6A', '6B', '6C', '6D', '6E', '6F', '7A', '7B', '7C', '7D', '7E', '7F', '8A', '8B', '8C', '8D', '8E', '8F', '9A', '9B', '9C', '9D', '9E', '9F']
    sorter_seter(seter)