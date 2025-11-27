.class synthetic Lcom/dropbox/core/v2/files/SearchError$1;
.super Ljava/lang/Object;
.source "SearchError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/files/SearchError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$dropbox$core$v2$files$SearchError$Tag:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 277
    invoke-static {}, Lcom/dropbox/core/v2/files/SearchError$Tag;->values()[Lcom/dropbox/core/v2/files/SearchError$Tag;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/dropbox/core/v2/files/SearchError$1;->$SwitchMap$com$dropbox$core$v2$files$SearchError$Tag:[I

    :try_start_0
    sget-object v1, Lcom/dropbox/core/v2/files/SearchError$Tag;->PATH:Lcom/dropbox/core/v2/files/SearchError$Tag;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/files/SearchError$Tag;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :try_start_1
    sget-object v0, Lcom/dropbox/core/v2/files/SearchError$1;->$SwitchMap$com$dropbox$core$v2$files$SearchError$Tag:[I

    sget-object v1, Lcom/dropbox/core/v2/files/SearchError$Tag;->INVALID_ARGUMENT:Lcom/dropbox/core/v2/files/SearchError$Tag;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/files/SearchError$Tag;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :try_start_2
    sget-object v0, Lcom/dropbox/core/v2/files/SearchError$1;->$SwitchMap$com$dropbox$core$v2$files$SearchError$Tag:[I

    sget-object v1, Lcom/dropbox/core/v2/files/SearchError$Tag;->INTERNAL_ERROR:Lcom/dropbox/core/v2/files/SearchError$Tag;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/files/SearchError$Tag;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    :catch_2
    :try_start_3
    sget-object v0, Lcom/dropbox/core/v2/files/SearchError$1;->$SwitchMap$com$dropbox$core$v2$files$SearchError$Tag:[I

    sget-object v1, Lcom/dropbox/core/v2/files/SearchError$Tag;->OTHER:Lcom/dropbox/core/v2/files/SearchError$Tag;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/files/SearchError$Tag;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    :catch_3
    return-void
.end method
