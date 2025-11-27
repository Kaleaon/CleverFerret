.class public Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;
.super Ljava/lang/Object;
.source "PreserveAspectRatio.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;,
        Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;
    }
.end annotation


# static fields
.field public static final BOTTOM:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

.field public static final END:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

.field public static final FULLSCREEN:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

.field public static final FULLSCREEN_START:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

.field public static final LETTERBOX:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

.field public static final START:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

.field public static final STRETCH:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

.field public static final TOP:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

.field public static final UNSCALED:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

.field private static final aspectRatioKeywords:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final alignment:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

.field private final scale:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 46
    new-instance v0, Ljava/util/HashMap;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;->aspectRatioKeywords:Ljava/util/Map;

    .line 53
    new-instance v1, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    const/4 v2, 0x0

    invoke-direct {v1, v2, v2}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;-><init>(Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;)V

    sput-object v1, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;->UNSCALED:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    .line 61
    new-instance v1, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    sget-object v3, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->none:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    invoke-direct {v1, v3, v2}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;-><init>(Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;)V

    sput-object v1, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;->STRETCH:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    .line 72
    new-instance v1, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    sget-object v2, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->xMidYMid:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    sget-object v3, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;->meet:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;

    invoke-direct {v1, v2, v3}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;-><init>(Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;)V

    sput-object v1, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;->LETTERBOX:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    .line 83
    new-instance v1, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    sget-object v2, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->xMinYMin:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    sget-object v3, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;->meet:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;

    invoke-direct {v1, v2, v3}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;-><init>(Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;)V

    sput-object v1, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;->START:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    .line 94
    new-instance v1, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    sget-object v2, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->xMaxYMax:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    sget-object v3, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;->meet:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;

    invoke-direct {v1, v2, v3}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;-><init>(Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;)V

    sput-object v1, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;->END:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    .line 105
    new-instance v1, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    sget-object v2, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->xMidYMin:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    sget-object v3, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;->meet:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;

    invoke-direct {v1, v2, v3}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;-><init>(Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;)V

    sput-object v1, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;->TOP:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    .line 116
    new-instance v1, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    sget-object v2, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->xMidYMax:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    sget-object v3, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;->meet:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;

    invoke-direct {v1, v2, v3}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;-><init>(Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;)V

    sput-object v1, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;->BOTTOM:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    .line 128
    new-instance v1, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    sget-object v2, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->xMidYMid:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    sget-object v3, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;->slice:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;

    invoke-direct {v1, v2, v3}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;-><init>(Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;)V

    sput-object v1, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;->FULLSCREEN:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    .line 140
    new-instance v1, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    sget-object v2, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->xMinYMin:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    sget-object v3, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;->slice:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;

    invoke-direct {v1, v2, v3}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;-><init>(Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;)V

    sput-object v1, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;->FULLSCREEN_START:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    .line 198
    const-string v1, "none"

    sget-object v2, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->none:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 199
    const-string v1, "xMinYMin"

    sget-object v2, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->xMinYMin:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 200
    const-string v1, "xMidYMin"

    sget-object v2, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->xMidYMin:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 201
    const-string v1, "xMaxYMin"

    sget-object v2, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->xMaxYMin:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 202
    const-string v1, "xMinYMid"

    sget-object v2, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->xMinYMid:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 203
    const-string v1, "xMidYMid"

    sget-object v2, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->xMidYMid:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 204
    const-string v1, "xMaxYMid"

    sget-object v2, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->xMaxYMid:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 205
    const-string v1, "xMinYMax"

    sget-object v2, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->xMinYMax:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 206
    const-string v1, "xMidYMax"

    sget-object v2, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->xMidYMax:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 207
    const-string v1, "xMaxYMax"

    sget-object v2, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;->xMaxYMax:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method constructor <init>(Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;)V
    .locals 0

    .line 215
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 216
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;->alignment:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    .line 217
    iput-object p2, p0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;->scale:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;

    return-void
.end method

.method public static of(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;
    .locals 1

    .line 230
    :try_start_0
    invoke-static {p0}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;->parsePreserveAspectRatio(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    move-result-object p0
    :try_end_0
    .catch Lcom/flyersoft/components/androidsvg/SVGParseException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 232
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/SVGParseException;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static parsePreserveAspectRatio(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    .line 284
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;

    invoke-direct {v0, p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;-><init>(Ljava/lang/String;)V

    .line 285
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    .line 287
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextToken()Ljava/lang/String;

    move-result-object v1

    .line 288
    const-string v2, "defer"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 289
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    .line 290
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextToken()Ljava/lang/String;

    move-result-object v1

    .line 293
    :cond_0
    sget-object v2, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;->aspectRatioKeywords:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    .line 296
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    .line 298
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->empty()Z

    move-result v2

    if-nez v2, :cond_3

    .line 299
    invoke-virtual {v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextToken()Ljava/lang/String;

    move-result-object v0

    .line 300
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    const-string v2, "meet"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, "slice"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 304
    sget-object p0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;->slice:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;

    goto :goto_0

    .line 306
    :cond_1
    new-instance v0, Lcom/flyersoft/components/androidsvg/SVGParseException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid preserveAspectRatio definition: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 302
    :cond_2
    sget-object p0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;->meet:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;

    goto :goto_0

    :cond_3
    const/4 p0, 0x0

    .line 309
    :goto_0
    new-instance v0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    invoke-direct {v0, v1, p0}, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;-><init>(Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;)V

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 266
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_2

    return v1

    .line 268
    :cond_2
    check-cast p1, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;

    .line 269
    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;->alignment:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    iget-object v3, p1, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;->alignment:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    if-ne v2, v3, :cond_3

    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;->scale:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;

    iget-object p1, p1, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;->scale:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;

    if-ne v2, p1, :cond_3

    return v0

    :cond_3
    return v1
.end method

.method public getAlignment()Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;
    .locals 1

    .line 244
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;->alignment:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    return-object v0
.end method

.method public getScale()Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;
    .locals 1

    .line 255
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;->scale:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 276
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;->alignment:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Alignment;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/PreserveAspectRatio;->scale:Lcom/flyersoft/components/androidsvg/PreserveAspectRatio$Scale;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
