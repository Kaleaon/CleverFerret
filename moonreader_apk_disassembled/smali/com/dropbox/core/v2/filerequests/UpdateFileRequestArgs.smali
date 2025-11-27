.class Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs;
.super Ljava/lang/Object;
.source "UpdateFileRequestArgs.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Serializer;,
        Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;
    }
.end annotation


# instance fields
.field protected final deadline:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final description:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final destination:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final id:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final open:Ljava/lang/Boolean;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final title:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 7
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    .line 110
    sget-object v4, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;->NO_UPDATE:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v6}, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;Ljava/lang/Boolean;Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p5    # Ljava/lang/Boolean;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_7

    .line 70
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_6

    .line 73
    const-string v0, "[-_0-9a-zA-Z]+"

    invoke-static {v0, p1}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 76
    iput-object p1, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs;->id:Ljava/lang/String;

    if-eqz p2, :cond_1

    .line 78
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p1

    if-lt p1, v1, :cond_0

    goto :goto_0

    .line 79
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'title\' is shorter than 1"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 82
    :cond_1
    :goto_0
    iput-object p2, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs;->title:Ljava/lang/String;

    if-eqz p3, :cond_3

    .line 84
    const-string p1, "/(.|[\\r\\n])*"

    invoke-static {p1, p3}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_1

    .line 85
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'destination\' does not match pattern"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 88
    :cond_3
    :goto_1
    iput-object p3, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs;->destination:Ljava/lang/String;

    if-eqz p4, :cond_4

    .line 92
    iput-object p4, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs;->deadline:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;

    .line 93
    iput-object p5, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs;->open:Ljava/lang/Boolean;

    .line 94
    iput-object p6, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs;->description:Ljava/lang/String;

    return-void

    .line 90
    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'deadline\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 74
    :cond_5
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'id\' does not match pattern"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 71
    :cond_6
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'id\' is shorter than 1"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 68
    :cond_7
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'id\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static newBuilder(Ljava/lang/String;)Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;
    .locals 1

    .line 190
    new-instance v0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;

    invoke-direct {v0, p0}, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Builder;-><init>(Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 350
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 351
    check-cast p1, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs;

    .line 352
    iget-object v2, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs;->id:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs;->id:Ljava/lang/String;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs;->title:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs;->title:Ljava/lang/String;

    if-eq v2, v3, :cond_3

    if-eqz v2, :cond_7

    .line 353
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs;->destination:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs;->destination:Ljava/lang/String;

    if-eq v2, v3, :cond_4

    if-eqz v2, :cond_7

    .line 354
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs;->deadline:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;

    iget-object v3, p1, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs;->deadline:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;

    if-eq v2, v3, :cond_5

    .line 355
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    :cond_5
    iget-object v2, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs;->open:Ljava/lang/Boolean;

    iget-object v3, p1, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs;->open:Ljava/lang/Boolean;

    if-eq v2, v3, :cond_6

    if-eqz v2, :cond_7

    .line 356
    invoke-virtual {v2, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    :cond_6
    iget-object v2, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs;->description:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs;->description:Ljava/lang/String;

    if-eq v2, p1, :cond_8

    if-eqz v2, :cond_7

    .line 357
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7

    goto :goto_0

    :cond_7
    return v1

    :cond_8
    :goto_0
    return v0

    :cond_9
    return v1
.end method

.method public getDeadline()Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 154
    iget-object v0, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs;->deadline:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;

    return-object v0
.end method

.method public getDescription()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 174
    iget-object v0, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs;->description:Ljava/lang/String;

    return-object v0
.end method

.method public getDestination()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 142
    iget-object v0, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs;->destination:Ljava/lang/String;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 120
    iget-object v0, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getOpen()Ljava/lang/Boolean;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 164
    iget-object v0, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs;->open:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 130
    iget-object v0, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs;->title:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 8

    .line 330
    iget-object v0, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs;->id:Ljava/lang/String;

    iget-object v1, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs;->title:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs;->destination:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs;->deadline:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestDeadline;

    iget-object v4, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs;->open:Ljava/lang/Boolean;

    iget-object v5, p0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs;->description:Ljava/lang/String;

    const/4 v6, 0x6

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v0, v6, v7

    const/4 v0, 0x1

    aput-object v1, v6, v0

    const/4 v0, 0x2

    aput-object v2, v6, v0

    const/4 v0, 0x3

    aput-object v3, v6, v0

    const/4 v0, 0x4

    aput-object v4, v6, v0

    const/4 v0, 0x5

    aput-object v5, v6, v0

    invoke-static {v6}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 367
    sget-object v0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Serializer;->INSTANCE:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 379
    sget-object v0, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Serializer;->INSTANCE:Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/filerequests/UpdateFileRequestArgs$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
