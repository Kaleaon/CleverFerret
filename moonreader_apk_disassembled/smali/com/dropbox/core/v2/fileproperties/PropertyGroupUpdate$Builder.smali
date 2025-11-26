.class public Lcom/dropbox/core/v2/fileproperties/PropertyGroupUpdate$Builder;
.super Ljava/lang/Object;
.source "PropertyGroupUpdate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/fileproperties/PropertyGroupUpdate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected addOrUpdateFields:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/fileproperties/PropertyField;",
            ">;"
        }
    .end annotation
.end field

.field protected removeFields:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected final templateId:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 153
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_2

    .line 157
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_1

    .line 160
    const-string v0, "(/|ptid:).*"

    invoke-static {v0, p1}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 163
    iput-object p1, p0, Lcom/dropbox/core/v2/fileproperties/PropertyGroupUpdate$Builder;->templateId:Ljava/lang/String;

    const/4 p1, 0x0

    .line 164
    iput-object p1, p0, Lcom/dropbox/core/v2/fileproperties/PropertyGroupUpdate$Builder;->addOrUpdateFields:Ljava/util/List;

    .line 165
    iput-object p1, p0, Lcom/dropbox/core/v2/fileproperties/PropertyGroupUpdate$Builder;->removeFields:Ljava/util/List;

    return-void

    .line 161
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'templateId\' does not match pattern"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 158
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'templateId\' is shorter than 1"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 155
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Required value for \'templateId\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/fileproperties/PropertyGroupUpdate;
    .locals 4

    .line 223
    new-instance v0, Lcom/dropbox/core/v2/fileproperties/PropertyGroupUpdate;

    iget-object v1, p0, Lcom/dropbox/core/v2/fileproperties/PropertyGroupUpdate$Builder;->templateId:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/fileproperties/PropertyGroupUpdate$Builder;->addOrUpdateFields:Ljava/util/List;

    iget-object v3, p0, Lcom/dropbox/core/v2/fileproperties/PropertyGroupUpdate$Builder;->removeFields:Ljava/util/List;

    invoke-direct {v0, v1, v2, v3}, Lcom/dropbox/core/v2/fileproperties/PropertyGroupUpdate;-><init>(Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    return-object v0
.end method

.method public withAddOrUpdateFields(Ljava/util/List;)Lcom/dropbox/core/v2/fileproperties/PropertyGroupUpdate$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/fileproperties/PropertyField;",
            ">;)",
            "Lcom/dropbox/core/v2/fileproperties/PropertyGroupUpdate$Builder;"
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 183
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/dropbox/core/v2/fileproperties/PropertyField;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 185
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "An item in list \'addOrUpdateFields\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 189
    :cond_1
    iput-object p1, p0, Lcom/dropbox/core/v2/fileproperties/PropertyGroupUpdate$Builder;->addOrUpdateFields:Ljava/util/List;

    return-object p0
.end method

.method public withRemoveFields(Ljava/util/List;)Lcom/dropbox/core/v2/fileproperties/PropertyGroupUpdate$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/dropbox/core/v2/fileproperties/PropertyGroupUpdate$Builder;"
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 206
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 208
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "An item in list \'removeFields\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 212
    :cond_1
    iput-object p1, p0, Lcom/dropbox/core/v2/fileproperties/PropertyGroupUpdate$Builder;->removeFields:Ljava/util/List;

    return-object p0
.end method
