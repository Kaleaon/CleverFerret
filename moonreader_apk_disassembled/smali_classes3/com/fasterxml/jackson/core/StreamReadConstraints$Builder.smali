.class public final Lcom/fasterxml/jackson/core/StreamReadConstraints$Builder;
.super Ljava/lang/Object;
.source "StreamReadConstraints.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/fasterxml/jackson/core/StreamReadConstraints;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private maxNestingDepth:I

.field private maxNumLen:I

.field private maxStringLen:I


# direct methods
.method constructor <init>()V
    .locals 2

    const/16 v0, 0x3e8

    const v1, 0x4c4b40

    .line 123
    invoke-direct {p0, v0, v0, v1}, Lcom/fasterxml/jackson/core/StreamReadConstraints$Builder;-><init>(III)V

    return-void
.end method

.method constructor <init>(III)V
    .locals 0

    .line 126
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 127
    iput p1, p0, Lcom/fasterxml/jackson/core/StreamReadConstraints$Builder;->maxNestingDepth:I

    .line 128
    iput p2, p0, Lcom/fasterxml/jackson/core/StreamReadConstraints$Builder;->maxNumLen:I

    .line 129
    iput p3, p0, Lcom/fasterxml/jackson/core/StreamReadConstraints$Builder;->maxStringLen:I

    return-void
.end method

.method constructor <init>(Lcom/fasterxml/jackson/core/StreamReadConstraints;)V
    .locals 1

    .line 132
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 133
    iget v0, p1, Lcom/fasterxml/jackson/core/StreamReadConstraints;->_maxNestingDepth:I

    iput v0, p0, Lcom/fasterxml/jackson/core/StreamReadConstraints$Builder;->maxNestingDepth:I

    .line 134
    iget v0, p1, Lcom/fasterxml/jackson/core/StreamReadConstraints;->_maxNumLen:I

    iput v0, p0, Lcom/fasterxml/jackson/core/StreamReadConstraints$Builder;->maxNumLen:I

    .line 135
    iget p1, p1, Lcom/fasterxml/jackson/core/StreamReadConstraints;->_maxStringLen:I

    iput p1, p0, Lcom/fasterxml/jackson/core/StreamReadConstraints$Builder;->maxStringLen:I

    return-void
.end method


# virtual methods
.method public build()Lcom/fasterxml/jackson/core/StreamReadConstraints;
    .locals 4

    .line 139
    new-instance v0, Lcom/fasterxml/jackson/core/StreamReadConstraints;

    iget v1, p0, Lcom/fasterxml/jackson/core/StreamReadConstraints$Builder;->maxNestingDepth:I

    iget v2, p0, Lcom/fasterxml/jackson/core/StreamReadConstraints$Builder;->maxNumLen:I

    iget v3, p0, Lcom/fasterxml/jackson/core/StreamReadConstraints$Builder;->maxStringLen:I

    invoke-direct {v0, v1, v2, v3}, Lcom/fasterxml/jackson/core/StreamReadConstraints;-><init>(III)V

    return-object v0
.end method

.method public maxNestingDepth(I)Lcom/fasterxml/jackson/core/StreamReadConstraints$Builder;
    .locals 1

    if-ltz p1, :cond_0

    .line 78
    iput p1, p0, Lcom/fasterxml/jackson/core/StreamReadConstraints$Builder;->maxNestingDepth:I

    return-object p0

    .line 76
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Cannot set maxNestingDepth to a negative value"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public maxNumberLength(I)Lcom/fasterxml/jackson/core/StreamReadConstraints$Builder;
    .locals 1

    if-ltz p1, :cond_0

    .line 95
    iput p1, p0, Lcom/fasterxml/jackson/core/StreamReadConstraints$Builder;->maxNumLen:I

    return-object p0

    .line 93
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Cannot set maxNumberLength to a negative value"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public maxStringLength(I)Lcom/fasterxml/jackson/core/StreamReadConstraints$Builder;
    .locals 1

    if-ltz p1, :cond_0

    .line 118
    iput p1, p0, Lcom/fasterxml/jackson/core/StreamReadConstraints$Builder;->maxStringLen:I

    return-object p0

    .line 116
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Cannot set maxStringLen to a negative value"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
