.class public Lcom/dropbox/core/v2/files/RelocationArg$Builder;
.super Ljava/lang/Object;
.source "RelocationArg.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/files/RelocationArg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected allowOwnershipTransfer:Z

.field protected allowSharedFolder:Z

.field protected autorename:Z

.field protected final fromPath:Ljava/lang/String;

.field protected final toPath:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 157
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_3

    .line 161
    const-string v0, "(/(.|[\\r\\n])*)|(ns:[0-9]+(/.*)?)|(id:.*)"

    invoke-static {v0, p1}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 164
    iput-object p1, p0, Lcom/dropbox/core/v2/files/RelocationArg$Builder;->fromPath:Ljava/lang/String;

    if-eqz p2, :cond_1

    .line 168
    invoke-static {v0, p2}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 171
    iput-object p2, p0, Lcom/dropbox/core/v2/files/RelocationArg$Builder;->toPath:Ljava/lang/String;

    const/4 p1, 0x0

    .line 172
    iput-boolean p1, p0, Lcom/dropbox/core/v2/files/RelocationArg$Builder;->allowSharedFolder:Z

    .line 173
    iput-boolean p1, p0, Lcom/dropbox/core/v2/files/RelocationArg$Builder;->autorename:Z

    .line 174
    iput-boolean p1, p0, Lcom/dropbox/core/v2/files/RelocationArg$Builder;->allowOwnershipTransfer:Z

    return-void

    .line 169
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'toPath\' does not match pattern"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 166
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'toPath\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 162
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'fromPath\' does not match pattern"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 159
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'fromPath\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/files/RelocationArg;
    .locals 6

    .line 250
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationArg;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/RelocationArg$Builder;->fromPath:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/files/RelocationArg$Builder;->toPath:Ljava/lang/String;

    iget-boolean v3, p0, Lcom/dropbox/core/v2/files/RelocationArg$Builder;->allowSharedFolder:Z

    iget-boolean v4, p0, Lcom/dropbox/core/v2/files/RelocationArg$Builder;->autorename:Z

    iget-boolean v5, p0, Lcom/dropbox/core/v2/files/RelocationArg$Builder;->allowOwnershipTransfer:Z

    invoke-direct/range {v0 .. v5}, Lcom/dropbox/core/v2/files/RelocationArg;-><init>(Ljava/lang/String;Ljava/lang/String;ZZZ)V

    return-object v0
.end method

.method public withAllowOwnershipTransfer(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/RelocationArg$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 235
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/dropbox/core/v2/files/RelocationArg$Builder;->allowOwnershipTransfer:Z

    return-object p0

    :cond_0
    const/4 p1, 0x0

    .line 238
    iput-boolean p1, p0, Lcom/dropbox/core/v2/files/RelocationArg$Builder;->allowOwnershipTransfer:Z

    return-object p0
.end method

.method public withAllowSharedFolder(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/RelocationArg$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 190
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/dropbox/core/v2/files/RelocationArg$Builder;->allowSharedFolder:Z

    return-object p0

    :cond_0
    const/4 p1, 0x0

    .line 193
    iput-boolean p1, p0, Lcom/dropbox/core/v2/files/RelocationArg$Builder;->allowSharedFolder:Z

    return-object p0
.end method

.method public withAutorename(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/RelocationArg$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 212
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/dropbox/core/v2/files/RelocationArg$Builder;->autorename:Z

    return-object p0

    :cond_0
    const/4 p1, 0x0

    .line 215
    iput-boolean p1, p0, Lcom/dropbox/core/v2/files/RelocationArg$Builder;->autorename:Z

    return-object p0
.end method
