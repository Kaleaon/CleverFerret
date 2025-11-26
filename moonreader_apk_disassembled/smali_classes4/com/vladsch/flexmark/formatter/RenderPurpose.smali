.class public final enum Lcom/vladsch/flexmark/formatter/RenderPurpose;
.super Ljava/lang/Enum;
.source "RenderPurpose.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/vladsch/flexmark/formatter/RenderPurpose;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vladsch/flexmark/formatter/RenderPurpose;

.field public static final enum FORMAT:Lcom/vladsch/flexmark/formatter/RenderPurpose;

.field public static final enum TRANSLATED:Lcom/vladsch/flexmark/formatter/RenderPurpose;

.field public static final enum TRANSLATED_SPANS:Lcom/vladsch/flexmark/formatter/RenderPurpose;

.field public static final enum TRANSLATION_SPANS:Lcom/vladsch/flexmark/formatter/RenderPurpose;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 4
    new-instance v0, Lcom/vladsch/flexmark/formatter/RenderPurpose;

    const-string v1, "FORMAT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/formatter/RenderPurpose;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vladsch/flexmark/formatter/RenderPurpose;->FORMAT:Lcom/vladsch/flexmark/formatter/RenderPurpose;

    .line 5
    new-instance v1, Lcom/vladsch/flexmark/formatter/RenderPurpose;

    const-string v3, "TRANSLATION_SPANS"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/vladsch/flexmark/formatter/RenderPurpose;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/vladsch/flexmark/formatter/RenderPurpose;->TRANSLATION_SPANS:Lcom/vladsch/flexmark/formatter/RenderPurpose;

    .line 6
    new-instance v3, Lcom/vladsch/flexmark/formatter/RenderPurpose;

    const-string v5, "TRANSLATED_SPANS"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/vladsch/flexmark/formatter/RenderPurpose;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/vladsch/flexmark/formatter/RenderPurpose;->TRANSLATED_SPANS:Lcom/vladsch/flexmark/formatter/RenderPurpose;

    .line 7
    new-instance v5, Lcom/vladsch/flexmark/formatter/RenderPurpose;

    const-string v7, "TRANSLATED"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/vladsch/flexmark/formatter/RenderPurpose;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/vladsch/flexmark/formatter/RenderPurpose;->TRANSLATED:Lcom/vladsch/flexmark/formatter/RenderPurpose;

    const/4 v7, 0x4

    .line 3
    new-array v7, v7, [Lcom/vladsch/flexmark/formatter/RenderPurpose;

    aput-object v0, v7, v2

    aput-object v1, v7, v4

    aput-object v3, v7, v6

    aput-object v5, v7, v8

    sput-object v7, Lcom/vladsch/flexmark/formatter/RenderPurpose;->$VALUES:[Lcom/vladsch/flexmark/formatter/RenderPurpose;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 3
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/vladsch/flexmark/formatter/RenderPurpose;
    .locals 1

    .line 3
    const-class v0, Lcom/vladsch/flexmark/formatter/RenderPurpose;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/vladsch/flexmark/formatter/RenderPurpose;

    return-object p0
.end method

.method public static values()[Lcom/vladsch/flexmark/formatter/RenderPurpose;
    .locals 1

    .line 3
    sget-object v0, Lcom/vladsch/flexmark/formatter/RenderPurpose;->$VALUES:[Lcom/vladsch/flexmark/formatter/RenderPurpose;

    invoke-virtual {v0}, [Lcom/vladsch/flexmark/formatter/RenderPurpose;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vladsch/flexmark/formatter/RenderPurpose;

    return-object v0
.end method
