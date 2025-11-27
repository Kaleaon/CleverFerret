.class synthetic Lcom/dropbox/core/v2/fileproperties/PropertyType$1;
.super Ljava/lang/Object;
.source "PropertyType.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/fileproperties/PropertyType;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$dropbox$core$v2$fileproperties$PropertyType:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 46
    invoke-static {}, Lcom/dropbox/core/v2/fileproperties/PropertyType;->values()[Lcom/dropbox/core/v2/fileproperties/PropertyType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/dropbox/core/v2/fileproperties/PropertyType$1;->$SwitchMap$com$dropbox$core$v2$fileproperties$PropertyType:[I

    :try_start_0
    sget-object v1, Lcom/dropbox/core/v2/fileproperties/PropertyType;->STRING:Lcom/dropbox/core/v2/fileproperties/PropertyType;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/fileproperties/PropertyType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method
