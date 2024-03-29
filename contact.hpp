#pragma once

#include <cstdint>

struct contact
{
    static const constexpr auto table() { return "contact"; }

    struct primary_key
    {
        static const constexpr auto c_name() { return "id"; }
        int32_t value{0};
    } primary_key;

    struct family_name
    {
        static const constexpr auto c_name() { return "family_name"; }
        // static const constexpr auto name() { return "Family Name (Latin script)"; }
        std::string value{};
    } name;

    struct forenames
    {
        static const constexpr auto c_name() { return "forenames"; }
        // static const constexpr auto name() { return "Forenames (Latin script)"; }
        std::string value{};
    } forenames;

    struct email
    {
        static const constexpr auto c_name() { return "email"; }
        std::string value{};
    } email;

    struct calling_code
    {
        static const constexpr auto c_name() { return "calling_code"; }
        // static const constexpr auto max() { return 5; }
        std::string value{};
    } calling_code;

    struct phone
    {
        static const constexpr auto c_name() { return "phone"; }
        // static const constexpr auto max() { return 13; }
        std::string value{};
    } phone;
};
