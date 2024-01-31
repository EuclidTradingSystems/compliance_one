#pragma once

#include <cstdint>
#include <chrono>

struct company
{
    static const constexpr auto table() { return "company"; }

    struct primary_key
    {
        static const constexpr auto c_name() { return "id"; }
        int32_t value{0};
    } primary_key;

    // KYC
    // counteparty information
    // accesible to all users

    struct counterparty_name
    {
        static const constexpr auto c_name() { return "name"; }
        // static const constexpr auto name() { return "Counterparty Name (Latin script)"; }
        std::string value{};
    } counterparty_name;

    struct local_name
    {
        static const constexpr auto c_name() { return "local_name"; }
        // static const constexpr auto name() { return "Counterparty Name (Local Characters)"; }
        std::string value{};
    } local_name;

    struct website
    {
        static const constexpr auto c_name() { return "website"; }
        std::string value{};
    } website;

    struct uuid
    {
        static const constexpr auto c_name() { return "uuid"; }
        // static const constexpr auto name() { return "Company Unique Identifier"; }
        std::string value{};
    } uuid;

    struct is_public
    {
        static const constexpr auto c_name() { return "is_public"; }
        // static const constexpr auto name() { return "Company Publically Listed"; }
        std::string value{};
    } is_public;

    struct comercial_registery
    {
        static const constexpr auto c_name() { return "comercial_registery"; }
        // static const constexpr auto name() { return "Commercial Registry Number"; }
        std::string value{};
    } comercial_registery;

    struct is_branch
    {
        static const constexpr auto c_name() { return "is_branch"; }
        // static const constexpr auto name() { return "Is a Branch"; }
        bool value{};
    } is_branch;

    struct branch_registery
    {
        static const constexpr auto c_name() { return "branch_registery"; }
        // static const constexpr auto name() { return "Branch Commercial Registry Number"; }
        std::string value{};
    } branch_registery;

    // foreign key Country
    struct listing_country
    {
        static const constexpr auto c_name() { return "listing_country"; }
        // static const constexpr auto name() { return "Country of Main Listing"; }
        uint32_t value{0};
        static const constexpr auto references() { return &country::primary_key; }
    } listing_country;

    struct lei
    {
        static const constexpr auto c_name() { return "lei"; }
        // static const constexpr auto name() { return "Legal Entitiy Identifier (LEI)"; }
        std::string value{};
    } lei;

    // address_spec address;

    // contact person

    // ABC

    // foreign key Individual
    struct pep
    {
        static const constexpr auto c_name() { return "pep"; }
        // static const constexpr auto name() { return "Politically Exposed Person (PEP)"; }
        bool value{};
    } pep;

    struct soe
    {
        static const constexpr auto c_name() { return "soe"; }
        // static const constexpr auto name() { return "State Owned Enterprise (SOE)"; }
        bool value{};
    } soe;

    // other notable persons linked to

    // regulatory
    // EMIR

    enum categories
    {
        fc,
        fcplus,
        fcminus,
        nfc,
        nfcplus,
        nfcminus,
    };

    // MIFID 2

    struct regulated
    {
        static const constexpr auto c_name() { return "regulated"; }
        bool value{};
    } regulated;

    // regulators --- foreign table
    struct ancellery
    {
        static const constexpr auto c_name() { return "ancellery"; }
        // static const constexpr auto name() { return "ANCILLARY status"; }
        bool value{};
    } ancellery;

    // REMIT

    struct acer
    {
        static const constexpr auto c_name() { return "acer"; }
        // static const constexpr auto name() { return "ACER Code"; }
        std::string value{};
    } acer;

    // EIC code(s) -- foreign table

    // Dodd Frank
    // DF Categorisation
//    enum df_categories
//    {

//    };

    // sanctions
//    sanctions_spec sanctions;
};
