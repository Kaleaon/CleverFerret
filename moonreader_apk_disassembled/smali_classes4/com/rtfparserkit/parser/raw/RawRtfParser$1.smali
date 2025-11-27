.class synthetic Lcom/rtfparserkit/parser/raw/RawRtfParser$1;
.super Ljava/lang/Object;
.source "RawRtfParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rtfparserkit/parser/raw/RawRtfParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$rtfparserkit$rtf$Command:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 277
    invoke-static {}, Lcom/rtfparserkit/rtf/Command;->values()[Lcom/rtfparserkit/rtf/Command;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/rtfparserkit/parser/raw/RawRtfParser$1;->$SwitchMap$com$rtfparserkit$rtf$Command:[I

    :try_start_0
    sget-object v1, Lcom/rtfparserkit/rtf/Command;->bin:Lcom/rtfparserkit/rtf/Command;

    invoke-virtual {v1}, Lcom/rtfparserkit/rtf/Command;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :try_start_1
    sget-object v0, Lcom/rtfparserkit/parser/raw/RawRtfParser$1;->$SwitchMap$com$rtfparserkit$rtf$Command:[I

    sget-object v1, Lcom/rtfparserkit/rtf/Command;->hex:Lcom/rtfparserkit/rtf/Command;

    invoke-virtual {v1}, Lcom/rtfparserkit/rtf/Command;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    return-void
.end method
