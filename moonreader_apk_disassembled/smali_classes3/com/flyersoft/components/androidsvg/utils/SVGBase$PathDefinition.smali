.class Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;
.super Ljava/lang/Object;
.source "SVGBase.java"

# interfaces
.implements Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathInterface;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "PathDefinition"
.end annotation


# static fields
.field private static final ARCTO:B = 0x4t

.field private static final CLOSE:B = 0x8t

.field private static final CUBICTO:B = 0x2t

.field private static final LINETO:B = 0x1t

.field private static final MOVETO:B = 0x0t

.field private static final QUADTO:B = 0x3t


# instance fields
.field private commands:[B

.field private commandsLength:I

.field private coords:[F

.field private coordsLength:I


# direct methods
.method constructor <init>()V
    .locals 1

    .line 1999
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 1986
    iput v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->commandsLength:I

    .line 1988
    iput v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->coordsLength:I

    const/16 v0, 0x8

    .line 2000
    new-array v0, v0, [B

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->commands:[B

    const/16 v0, 0x10

    .line 2001
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->coords:[F

    return-void
.end method

.method private addCommand(B)V
    .locals 4

    .line 2013
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->commandsLength:I

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->commands:[B

    array-length v2, v1

    if-ne v0, v2, :cond_0

    .line 2014
    array-length v0, v1

    mul-int/lit8 v0, v0, 0x2

    new-array v0, v0, [B

    .line 2015
    array-length v2, v1

    const/4 v3, 0x0

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2016
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->commands:[B

    .line 2018
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->commands:[B

    iget v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->commandsLength:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->commandsLength:I

    aput-byte p1, v0, v1

    return-void
.end method

.method private coordsEnsure(I)V
    .locals 3

    .line 2024
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->coords:[F

    array-length v1, v0

    iget v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->coordsLength:I

    add-int/2addr v2, p1

    if-ge v1, v2, :cond_0

    .line 2025
    array-length p1, v0

    mul-int/lit8 p1, p1, 0x2

    new-array p1, p1, [F

    .line 2026
    array-length v1, v0

    const/4 v2, 0x0

    invoke-static {v0, v2, p1, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2027
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->coords:[F

    :cond_0
    return-void
.end method


# virtual methods
.method public arcTo(FFFZZFF)V
    .locals 2

    if-eqz p4, :cond_0

    const/4 p4, 0x2

    goto :goto_0

    :cond_0
    const/4 p4, 0x0

    :goto_0
    or-int/lit8 p4, p4, 0x4

    or-int/2addr p4, p5

    int-to-byte p4, p4

    .line 2082
    invoke-direct {p0, p4}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->addCommand(B)V

    const/4 p4, 0x5

    .line 2083
    invoke-direct {p0, p4}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->coordsEnsure(I)V

    .line 2084
    iget-object p5, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->coords:[F

    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->coordsLength:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->coordsLength:I

    aput p1, p5, v0

    add-int/lit8 p1, v0, 0x2

    .line 2085
    iput p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->coordsLength:I

    aput p2, p5, v1

    add-int/lit8 p2, v0, 0x3

    .line 2086
    iput p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->coordsLength:I

    aput p3, p5, p1

    add-int/lit8 p1, v0, 0x4

    .line 2087
    iput p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->coordsLength:I

    aput p6, p5, p2

    add-int/2addr v0, p4

    .line 2088
    iput v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->coordsLength:I

    aput p7, p5, p1

    return-void
.end method

.method public close()V
    .locals 1

    const/16 v0, 0x8

    .line 2095
    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->addCommand(B)V

    return-void
.end method

.method public cubicTo(FFFFFF)V
    .locals 4

    const/4 v0, 0x2

    .line 2055
    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->addCommand(B)V

    const/4 v0, 0x6

    .line 2056
    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->coordsEnsure(I)V

    .line 2057
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->coords:[F

    iget v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->coordsLength:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->coordsLength:I

    aput p1, v1, v2

    add-int/lit8 p1, v2, 0x2

    .line 2058
    iput p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->coordsLength:I

    aput p2, v1, v3

    add-int/lit8 p2, v2, 0x3

    .line 2059
    iput p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->coordsLength:I

    aput p3, v1, p1

    add-int/lit8 p1, v2, 0x4

    .line 2060
    iput p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->coordsLength:I

    aput p4, v1, p2

    add-int/lit8 p2, v2, 0x5

    .line 2061
    iput p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->coordsLength:I

    aput p5, v1, p1

    add-int/2addr v2, v0

    .line 2062
    iput v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->coordsLength:I

    aput p6, v1, p2

    return-void
.end method

.method enumeratePath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathInterface;)V
    .locals 12

    const/4 v8, 0x0

    const/4 v0, 0x0

    const/4 v9, 0x0

    .line 2103
    :goto_0
    iget v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->commandsLength:I

    if-ge v9, v1, :cond_7

    .line 2105
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->commands:[B

    aget-byte v1, v1, v9

    if-eqz v1, :cond_6

    const/4 v2, 0x1

    if-eq v1, v2, :cond_5

    const/4 v3, 0x2

    if-eq v1, v3, :cond_4

    const/4 v3, 0x3

    if-eq v1, v3, :cond_3

    const/16 v3, 0x8

    if-eq v1, v3, :cond_2

    and-int/lit8 v3, v1, 0x2

    if-eqz v3, :cond_0

    const/4 v4, 0x1

    goto :goto_1

    :cond_0
    const/4 v4, 0x0

    :goto_1
    and-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_1

    const/4 v5, 0x1

    goto :goto_2

    :cond_1
    const/4 v5, 0x0

    .line 2126
    :goto_2
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->coords:[F

    add-int/lit8 v2, v0, 0x1

    move-object v3, v1

    aget v1, v3, v0

    add-int/lit8 v6, v0, 0x2

    aget v2, v3, v2

    add-int/lit8 v7, v0, 0x3

    aget v6, v3, v6

    add-int/lit8 v10, v0, 0x4

    aget v7, v3, v7

    add-int/lit8 v11, v0, 0x5

    aget v0, v3, v10

    move v3, v6

    move v6, v7

    move v7, v0

    move-object v0, p1

    invoke-interface/range {v0 .. v7}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathInterface;->arcTo(FFFZZFF)V

    move v0, v11

    goto :goto_3

    .line 2121
    :cond_2
    invoke-interface {p1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathInterface;->close()V

    goto :goto_3

    .line 2118
    :cond_3
    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->coords:[F

    add-int/lit8 v3, v0, 0x1

    aget v4, v2, v0

    add-int/lit8 v5, v0, 0x2

    aget v3, v2, v3

    add-int/lit8 v6, v0, 0x3

    aget v5, v2, v5

    add-int/lit8 v0, v0, 0x4

    aget v2, v2, v6

    invoke-interface {p1, v4, v3, v5, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathInterface;->quadTo(FFFF)V

    goto :goto_3

    .line 2115
    :cond_4
    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->coords:[F

    add-int/lit8 v3, v0, 0x1

    aget v1, v2, v0

    add-int/lit8 v4, v0, 0x2

    aget v3, v2, v3

    add-int/lit8 v5, v0, 0x3

    aget v4, v2, v4

    add-int/lit8 v6, v0, 0x4

    aget v5, v2, v5

    add-int/lit8 v7, v0, 0x5

    aget v6, v2, v6

    add-int/lit8 v10, v0, 0x6

    aget v0, v2, v7

    move v2, v3

    move v3, v4

    move v4, v5

    move v5, v6

    move v6, v0

    move-object v0, p1

    invoke-interface/range {v0 .. v6}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathInterface;->cubicTo(FFFFFF)V

    move v0, v10

    goto :goto_3

    .line 2112
    :cond_5
    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->coords:[F

    add-int/lit8 v3, v0, 0x1

    aget v4, v2, v0

    add-int/lit8 v0, v0, 0x2

    aget v2, v2, v3

    invoke-interface {p1, v4, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathInterface;->lineTo(FF)V

    goto :goto_3

    .line 2109
    :cond_6
    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->coords:[F

    add-int/lit8 v3, v0, 0x1

    aget v4, v2, v0

    add-int/lit8 v0, v0, 0x2

    aget v2, v2, v3

    invoke-interface {p1, v4, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathInterface;->moveTo(FF)V

    :goto_3
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_0

    :cond_7
    return-void
.end method

.method isEmpty()Z
    .locals 1

    .line 2007
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->commandsLength:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public lineTo(FF)V
    .locals 4

    const/4 v0, 0x1

    .line 2045
    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->addCommand(B)V

    const/4 v0, 0x2

    .line 2046
    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->coordsEnsure(I)V

    .line 2047
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->coords:[F

    iget v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->coordsLength:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->coordsLength:I

    aput p1, v1, v2

    add-int/2addr v2, v0

    .line 2048
    iput v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->coordsLength:I

    aput p2, v1, v3

    return-void
.end method

.method public moveTo(FF)V
    .locals 4

    const/4 v0, 0x0

    .line 2035
    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->addCommand(B)V

    const/4 v0, 0x2

    .line 2036
    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->coordsEnsure(I)V

    .line 2037
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->coords:[F

    iget v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->coordsLength:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->coordsLength:I

    aput p1, v1, v2

    add-int/2addr v2, v0

    .line 2038
    iput v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->coordsLength:I

    aput p2, v1, v3

    return-void
.end method

.method public quadTo(FFFF)V
    .locals 4

    const/4 v0, 0x3

    .line 2069
    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->addCommand(B)V

    const/4 v0, 0x4

    .line 2070
    invoke-direct {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->coordsEnsure(I)V

    .line 2071
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->coords:[F

    iget v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->coordsLength:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->coordsLength:I

    aput p1, v1, v2

    add-int/lit8 p1, v2, 0x2

    .line 2072
    iput p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->coordsLength:I

    aput p2, v1, v3

    add-int/lit8 p2, v2, 0x3

    .line 2073
    iput p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->coordsLength:I

    aput p3, v1, p1

    add-int/2addr v2, v0

    .line 2074
    iput v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->coordsLength:I

    aput p4, v1, p2

    return-void
.end method
