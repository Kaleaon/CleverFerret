.class synthetic Lcom/dropbox/core/v2/fileproperties/ModifyTemplateError$1;
.super Ljava/lang/Object;
.source "ModifyTemplateError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/fileproperties/ModifyTemplateError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$dropbox$core$v2$fileproperties$ModifyTemplateError$Tag:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 298
    invoke-static {}, Lcom/dropbox/core/v2/fileproperties/ModifyTemplateError$Tag;->values()[Lcom/dropbox/core/v2/fileproperties/ModifyTemplateError$Tag;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/dropbox/core/v2/fileproperties/ModifyTemplateError$1;->$SwitchMap$com$dropbox$core$v2$fileproperties$ModifyTemplateError$Tag:[I

    :try_start_0
    sget-object v1, Lcom/dropbox/core/v2/fileproperties/ModifyTemplateError$Tag;->TEMPLATE_NOT_FOUND:Lcom/dropbox/core/v2/fileproperties/ModifyTemplateError$Tag;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/fileproperties/ModifyTemplateError$Tag;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :try_start_1
    sget-object v0, Lcom/dropbox/core/v2/fileproperties/ModifyTemplateError$1;->$SwitchMap$com$dropbox$core$v2$fileproperties$ModifyTemplateError$Tag:[I

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/ModifyTemplateError$Tag;->RESTRICTED_CONTENT:Lcom/dropbox/core/v2/fileproperties/ModifyTemplateError$Tag;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/fileproperties/ModifyTemplateError$Tag;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :try_start_2
    sget-object v0, Lcom/dropbox/core/v2/fileproperties/ModifyTemplateError$1;->$SwitchMap$com$dropbox$core$v2$fileproperties$ModifyTemplateError$Tag:[I

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/ModifyTemplateError$Tag;->OTHER:Lcom/dropbox/core/v2/fileproperties/ModifyTemplateError$Tag;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/fileproperties/ModifyTemplateError$Tag;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    :catch_2
    :try_start_3
    sget-object v0, Lcom/dropbox/core/v2/fileproperties/ModifyTemplateError$1;->$SwitchMap$com$dropbox$core$v2$fileproperties$ModifyTemplateError$Tag:[I

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/ModifyTemplateError$Tag;->CONFLICTING_PROPERTY_NAMES:Lcom/dropbox/core/v2/fileproperties/ModifyTemplateError$Tag;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/fileproperties/ModifyTemplateError$Tag;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    :catch_3
    :try_start_4
    sget-object v0, Lcom/dropbox/core/v2/fileproperties/ModifyTemplateError$1;->$SwitchMap$com$dropbox$core$v2$fileproperties$ModifyTemplateError$Tag:[I

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/ModifyTemplateError$Tag;->TOO_MANY_PROPERTIES:Lcom/dropbox/core/v2/fileproperties/ModifyTemplateError$Tag;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/fileproperties/ModifyTemplateError$Tag;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_4

    :catch_4
    :try_start_5
    sget-object v0, Lcom/dropbox/core/v2/fileproperties/ModifyTemplateError$1;->$SwitchMap$com$dropbox$core$v2$fileproperties$ModifyTemplateError$Tag:[I

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/ModifyTemplateError$Tag;->TOO_MANY_TEMPLATES:Lcom/dropbox/core/v2/fileproperties/ModifyTemplateError$Tag;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/fileproperties/ModifyTemplateError$Tag;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_5

    :catch_5
    :try_start_6
    sget-object v0, Lcom/dropbox/core/v2/fileproperties/ModifyTemplateError$1;->$SwitchMap$com$dropbox$core$v2$fileproperties$ModifyTemplateError$Tag:[I

    sget-object v1, Lcom/dropbox/core/v2/fileproperties/ModifyTemplateError$Tag;->TEMPLATE_ATTRIBUTE_TOO_LARGE:Lcom/dropbox/core/v2/fileproperties/ModifyTemplateError$Tag;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/fileproperties/ModifyTemplateError$Tag;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_6

    :catch_6
    return-void
.end method
