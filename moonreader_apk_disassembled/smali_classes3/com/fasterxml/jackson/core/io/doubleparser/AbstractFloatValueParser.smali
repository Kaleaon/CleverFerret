.class abstract Lcom/fasterxml/jackson/core/io/doubleparser/AbstractFloatValueParser;
.super Lcom/fasterxml/jackson/core/io/doubleparser/AbstractNumberParser;
.source "AbstractFloatValueParser.java"


# static fields
.field static final MAX_EXPONENT_NUMBER:I = 0x400

.field public static final MAX_INPUT_LENGTH:I = 0x7ffffffb

.field static final MINIMAL_NINETEEN_DIGIT_INTEGER:J = 0xde0b6b3a7640000L


# direct methods
.method constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/io/doubleparser/AbstractNumberParser;-><init>()V

    return-void
.end method
