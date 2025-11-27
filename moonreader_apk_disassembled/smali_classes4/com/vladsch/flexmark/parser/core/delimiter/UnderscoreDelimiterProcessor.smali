.class public Lcom/vladsch/flexmark/parser/core/delimiter/UnderscoreDelimiterProcessor;
.super Lcom/vladsch/flexmark/parser/core/delimiter/EmphasisDelimiterProcessor;
.source "UnderscoreDelimiterProcessor.java"


# direct methods
.method public constructor <init>(Z)V
    .locals 1

    const/16 v0, 0x5f

    .line 5
    invoke-direct {p0, v0, p1}, Lcom/vladsch/flexmark/parser/core/delimiter/EmphasisDelimiterProcessor;-><init>(CZ)V

    return-void
.end method


# virtual methods
.method public canBeCloser(Ljava/lang/String;Ljava/lang/String;ZZZZZZ)Z
    .locals 0

    if-eqz p4, :cond_1

    if-eqz p3, :cond_0

    if-eqz p6, :cond_1

    :cond_0
    const/4 p1, 0x1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public canBeOpener(Ljava/lang/String;Ljava/lang/String;ZZZZZZ)Z
    .locals 0

    if-eqz p3, :cond_1

    if-eqz p4, :cond_0

    if-eqz p5, :cond_1

    :cond_0
    const/4 p1, 0x1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method
