#pragma once

#include "sovereignty.hpp"

struct country
{
    static const constexpr auto table() { return "country"; }
    static const constexpr auto primary_key() { return &country::id; }

    struct id
    {
        static const constexpr auto c_name() { return "id"; }
        int32_t value{0};
    } id;

    struct country_name
    {
        static const constexpr auto c_name() { return "country_name"; }
        static const constexpr auto name() { return "Country name"; }
        std::string value{};
    } country_name;

    struct official_state_name
    {
        static const constexpr auto c_name() { return "official_state_name"; }
        static const constexpr auto name() { return "Official state name"; }
        std::string value{};
    } official_state_name;

    struct sovereignty_id
    {
        static const constexpr auto c_name() { return "sovereignty_id"; }
        int32_t value{0};
        static const constexpr auto froeign_key() { return &country::sovereignty_id; }
    } sovereignty_id;
};