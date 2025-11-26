.class public final Lcom/dropbox/core/LocalizedText;
.super Ljava/lang/Object;
.source "LocalizedText.java"


# static fields
.field static final STONE_SERIALIZER:Lcom/dropbox/core/stone/StoneSerializer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/dropbox/core/stone/StoneSerializer<",
            "Lcom/dropbox/core/LocalizedText;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final locale:Ljava/lang/String;

.field private final text:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 66
    new-instance v0, Lcom/dropbox/core/LocalizedText$1;

    invoke-direct {v0}, Lcom/dropbox/core/LocalizedText$1;-><init>()V

    sput-object v0, Lcom/dropbox/core/LocalizedText;->STONE_SERIALIZER:Lcom/dropbox/core/stone/StoneSerializer;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    if-eqz p2, :cond_0

    .line 36
    iput-object p1, p0, Lcom/dropbox/core/LocalizedText;->text:Ljava/lang/String;

    .line 37
    iput-object p2, p0, Lcom/dropbox/core/LocalizedText;->locale:Ljava/lang/String;

    return-void

    .line 33
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "locale"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 30
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "text"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public getLocale()Ljava/lang/String;
    .locals 1

    .line 55
    iget-object v0, p0, Lcom/dropbox/core/LocalizedText;->locale:Ljava/lang/String;

    return-object v0
.end method

.method public getText()Ljava/lang/String;
    .locals 1

    .line 46
    iget-object v0, p0, Lcom/dropbox/core/LocalizedText;->text:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 60
    iget-object v0, p0, Lcom/dropbox/core/LocalizedText;->text:Ljava/lang/String;

    return-object v0
.end method
