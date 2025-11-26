.class public Lcom/fasterxml/jackson/core/StreamReadConstraints;
.super Ljava/lang/Object;
.source "StreamReadConstraints.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/fasterxml/jackson/core/StreamReadConstraints$Builder;
    }
.end annotation


# static fields
.field private static final DEFAULT:Lcom/fasterxml/jackson/core/StreamReadConstraints;

.field public static final DEFAULT_MAX_DEPTH:I = 0x3e8

.field public static final DEFAULT_MAX_NUM_LEN:I = 0x3e8

.field public static final DEFAULT_MAX_STRING_LEN:I = 0x4c4b40

.field private static final MAX_BIGINT_SCALE_MAGNITUDE:I = 0x186a0

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field protected final _maxNestingDepth:I

.field protected final _maxNumLen:I

.field protected final _maxStringLen:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 57
    new-instance v0, Lcom/fasterxml/jackson/core/StreamReadConstraints;

    const/16 v1, 0x3e8

    const v2, 0x4c4b40

    invoke-direct {v0, v1, v1, v2}, Lcom/fasterxml/jackson/core/StreamReadConstraints;-><init>(III)V

    sput-object v0, Lcom/fasterxml/jackson/core/StreamReadConstraints;->DEFAULT:Lcom/fasterxml/jackson/core/StreamReadConstraints;

    return-void
.end method

.method protected constructor <init>(III)V
    .locals 0

    .line 149
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 150
    iput p1, p0, Lcom/fasterxml/jackson/core/StreamReadConstraints;->_maxNestingDepth:I

    .line 151
    iput p2, p0, Lcom/fasterxml/jackson/core/StreamReadConstraints;->_maxNumLen:I

    .line 152
    iput p3, p0, Lcom/fasterxml/jackson/core/StreamReadConstraints;->_maxStringLen:I

    return-void
.end method

.method public static builder()Lcom/fasterxml/jackson/core/StreamReadConstraints$Builder;
    .locals 1

    .line 156
    new-instance v0, Lcom/fasterxml/jackson/core/StreamReadConstraints$Builder;

    invoke-direct {v0}, Lcom/fasterxml/jackson/core/StreamReadConstraints$Builder;-><init>()V

    return-object v0
.end method

.method public static defaults()Lcom/fasterxml/jackson/core/StreamReadConstraints;
    .locals 1

    .line 160
    sget-object v0, Lcom/fasterxml/jackson/core/StreamReadConstraints;->DEFAULT:Lcom/fasterxml/jackson/core/StreamReadConstraints;

    return-object v0
.end method


# virtual methods
.method public getMaxNestingDepth()I
    .locals 1

    .line 184
    iget v0, p0, Lcom/fasterxml/jackson/core/StreamReadConstraints;->_maxNestingDepth:I

    return v0
.end method

.method public getMaxNumberLength()I
    .locals 1

    .line 194
    iget v0, p0, Lcom/fasterxml/jackson/core/StreamReadConstraints;->_maxNumLen:I

    return v0
.end method

.method public getMaxStringLength()I
    .locals 1

    .line 204
    iget v0, p0, Lcom/fasterxml/jackson/core/StreamReadConstraints;->_maxStringLen:I

    return v0
.end method

.method public rebuild()Lcom/fasterxml/jackson/core/StreamReadConstraints$Builder;
    .locals 1

    .line 168
    new-instance v0, Lcom/fasterxml/jackson/core/StreamReadConstraints$Builder;

    invoke-direct {v0, p0}, Lcom/fasterxml/jackson/core/StreamReadConstraints$Builder;-><init>(Lcom/fasterxml/jackson/core/StreamReadConstraints;)V

    return-object v0
.end method

.method public validateBigIntegerScale(I)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/core/exc/StreamConstraintsException;
        }
    .end annotation

    .line 314
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result v0

    const v1, 0x186a0

    if-gt v0, v1, :cond_0

    return-void

    .line 318
    :cond_0
    new-instance v0, Lcom/fasterxml/jackson/core/exc/StreamConstraintsException;

    .line 320
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 p1, 0x1

    aput-object v1, v2, p1

    .line 318
    const-string p1, "BigDecimal scale (%d) magnitude exceeds maximum allowed (%d)"

    invoke-static {p1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/fasterxml/jackson/core/exc/StreamConstraintsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public validateFPLength(I)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/core/exc/StreamConstraintsException;
        }
    .end annotation

    .line 251
    iget v0, p0, Lcom/fasterxml/jackson/core/StreamReadConstraints;->_maxNumLen:I

    if-gt p1, v0, :cond_0

    return-void

    .line 252
    :cond_0
    new-instance v0, Lcom/fasterxml/jackson/core/exc/StreamConstraintsException;

    .line 253
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iget v1, p0, Lcom/fasterxml/jackson/core/StreamReadConstraints;->_maxNumLen:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 p1, 0x1

    aput-object v1, v2, p1

    .line 252
    const-string p1, "Number length (%d) exceeds the maximum length (%d)"

    invoke-static {p1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/fasterxml/jackson/core/exc/StreamConstraintsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public validateIntegerLength(I)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/core/exc/StreamConstraintsException;
        }
    .end annotation

    .line 270
    iget v0, p0, Lcom/fasterxml/jackson/core/StreamReadConstraints;->_maxNumLen:I

    if-gt p1, v0, :cond_0

    return-void

    .line 271
    :cond_0
    new-instance v0, Lcom/fasterxml/jackson/core/exc/StreamConstraintsException;

    .line 272
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iget v1, p0, Lcom/fasterxml/jackson/core/StreamReadConstraints;->_maxNumLen:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 p1, 0x1

    aput-object v1, v2, p1

    .line 271
    const-string p1, "Number length (%d) exceeds the maximum length (%d)"

    invoke-static {p1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/fasterxml/jackson/core/exc/StreamConstraintsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public validateNestingDepth(I)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/core/exc/StreamConstraintsException;
        }
    .end annotation

    .line 226
    iget v0, p0, Lcom/fasterxml/jackson/core/StreamReadConstraints;->_maxNestingDepth:I

    if-gt p1, v0, :cond_0

    return-void

    .line 227
    :cond_0
    new-instance v0, Lcom/fasterxml/jackson/core/exc/StreamConstraintsException;

    .line 228
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iget v1, p0, Lcom/fasterxml/jackson/core/StreamReadConstraints;->_maxNestingDepth:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 p1, 0x1

    aput-object v1, v2, p1

    .line 227
    const-string p1, "Depth (%d) exceeds the maximum allowed nesting depth (%d)"

    invoke-static {p1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/fasterxml/jackson/core/exc/StreamConstraintsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public validateStringLength(I)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/core/exc/StreamConstraintsException;
        }
    .end annotation

    .line 289
    iget v0, p0, Lcom/fasterxml/jackson/core/StreamReadConstraints;->_maxStringLen:I

    if-gt p1, v0, :cond_0

    return-void

    .line 290
    :cond_0
    new-instance v0, Lcom/fasterxml/jackson/core/exc/StreamConstraintsException;

    .line 291
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iget v1, p0, Lcom/fasterxml/jackson/core/StreamReadConstraints;->_maxStringLen:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 p1, 0x1

    aput-object v1, v2, p1

    .line 290
    const-string p1, "String length (%d) exceeds the maximum length (%d)"

    invoke-static {p1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/fasterxml/jackson/core/exc/StreamConstraintsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
