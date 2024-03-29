#pragma once

#include <cstdint>
#include <string>

struct ctp_group
{
    static const constexpr auto table() { return "ctp_group"; }

    struct primary_key
    {
        static const constexpr auto c_name() { return "id"; }
        int32_t value{0};
    } primary_key;

    struct group_name
    {
        static const constexpr auto c_name() { return "name"; }
        std::string value{};
    } group_name;
};
