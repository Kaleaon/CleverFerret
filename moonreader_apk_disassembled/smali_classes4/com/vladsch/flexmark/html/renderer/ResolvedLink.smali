.class public Lcom/vladsch/flexmark/html/renderer/ResolvedLink;
.super Ljava/lang/Object;
.source "ResolvedLink.java"


# instance fields
.field private myAttributes:Lcom/vladsch/flexmark/util/html/Attributes;

.field private final myLinkType:Lcom/vladsch/flexmark/html/renderer/LinkType;

.field private final myStatus:Lcom/vladsch/flexmark/html/renderer/LinkStatus;

.field private final myUrl:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/html/renderer/LinkType;Ljava/lang/CharSequence;)V
    .locals 2

    const/4 v0, 0x0

    .line 13
    sget-object v1, Lcom/vladsch/flexmark/html/renderer/LinkStatus;->UNKNOWN:Lcom/vladsch/flexmark/html/renderer/LinkStatus;

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;-><init>(Lcom/vladsch/flexmark/html/renderer/LinkType;Ljava/lang/CharSequence;Lcom/vladsch/flexmark/util/html/Attributes;Lcom/vladsch/flexmark/html/renderer/LinkStatus;)V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/html/renderer/LinkType;Ljava/lang/CharSequence;Lcom/vladsch/flexmark/util/html/Attributes;)V
    .locals 1

    .line 17
    sget-object v0, Lcom/vladsch/flexmark/html/renderer/LinkStatus;->UNKNOWN:Lcom/vladsch/flexmark/html/renderer/LinkStatus;

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;-><init>(Lcom/vladsch/flexmark/html/renderer/LinkType;Ljava/lang/CharSequence;Lcom/vladsch/flexmark/util/html/Attributes;Lcom/vladsch/flexmark/html/renderer/LinkStatus;)V

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/html/renderer/LinkType;Ljava/lang/CharSequence;Lcom/vladsch/flexmark/util/html/Attributes;Lcom/vladsch/flexmark/html/renderer/LinkStatus;)V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->myLinkType:Lcom/vladsch/flexmark/html/renderer/LinkType;

    .line 33
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->myUrl:Ljava/lang/String;

    .line 34
    iput-object p4, p0, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->myStatus:Lcom/vladsch/flexmark/html/renderer/LinkStatus;

    if-eqz p3, :cond_0

    .line 36
    invoke-virtual {p0}, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->getNonNullAttributes()Lcom/vladsch/flexmark/util/html/Attributes;

    move-result-object p1

    invoke-virtual {p1, p3}, Lcom/vladsch/flexmark/util/html/Attributes;->addValues(Lcom/vladsch/flexmark/util/html/Attributes;)Lcom/vladsch/flexmark/util/html/Attributes;

    :cond_0
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3

    if-ne p0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    .line 101
    :cond_0
    instance-of v0, p1, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;

    const/4 v1, 0x0

    if-nez v0, :cond_1

    return v1

    .line 103
    :cond_1
    check-cast p1, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;

    .line 105
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->myLinkType:Lcom/vladsch/flexmark/html/renderer/LinkType;

    iget-object v2, p1, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->myLinkType:Lcom/vladsch/flexmark/html/renderer/LinkType;

    invoke-virtual {v0, v2}, Lcom/vladsch/flexmark/html/renderer/LinkType;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    return v1

    .line 106
    :cond_2
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->myUrl:Ljava/lang/String;

    iget-object v2, p1, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->myUrl:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    return v1

    .line 107
    :cond_3
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->myStatus:Lcom/vladsch/flexmark/html/renderer/LinkStatus;

    iget-object p1, p1, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->myStatus:Lcom/vladsch/flexmark/html/renderer/LinkStatus;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/html/renderer/LinkStatus;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public getAttributes()Lcom/vladsch/flexmark/util/html/Attributes;
    .locals 1

    .line 21
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->myAttributes:Lcom/vladsch/flexmark/util/html/Attributes;

    return-object v0
.end method

.method public getLinkType()Lcom/vladsch/flexmark/html/renderer/LinkType;
    .locals 1

    .line 46
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->myLinkType:Lcom/vladsch/flexmark/html/renderer/LinkType;

    return-object v0
.end method

.method public getNonNullAttributes()Lcom/vladsch/flexmark/util/html/Attributes;
    .locals 1

    .line 25
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->myAttributes:Lcom/vladsch/flexmark/util/html/Attributes;

    if-nez v0, :cond_0

    .line 26
    new-instance v0, Lcom/vladsch/flexmark/util/html/Attributes;

    invoke-direct {v0}, Lcom/vladsch/flexmark/util/html/Attributes;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->myAttributes:Lcom/vladsch/flexmark/util/html/Attributes;

    .line 28
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->myAttributes:Lcom/vladsch/flexmark/util/html/Attributes;

    return-object v0
.end method

.method public getStatus()Lcom/vladsch/flexmark/html/renderer/LinkStatus;
    .locals 1

    .line 50
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->myStatus:Lcom/vladsch/flexmark/html/renderer/LinkStatus;

    return-object v0
.end method

.method public getTarget()Ljava/lang/String;
    .locals 2

    .line 95
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->myAttributes:Lcom/vladsch/flexmark/util/html/Attributes;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    const-string v1, "target"

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/util/html/Attributes;->getValue(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 2

    .line 77
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->myAttributes:Lcom/vladsch/flexmark/util/html/Attributes;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    const-string v1, "title"

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/util/html/Attributes;->getValue(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 1

    .line 59
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->myUrl:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .line 112
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->myLinkType:Lcom/vladsch/flexmark/html/renderer/LinkType;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/html/renderer/LinkType;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    .line 113
    iget-object v1, p0, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->myUrl:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 114
    iget-object v1, p0, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->myStatus:Lcom/vladsch/flexmark/html/renderer/LinkStatus;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/html/renderer/LinkStatus;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public withLinkType(Lcom/vladsch/flexmark/html/renderer/LinkType;)Lcom/vladsch/flexmark/html/renderer/ResolvedLink;
    .locals 4

    .line 41
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->myLinkType:Lcom/vladsch/flexmark/html/renderer/LinkType;

    if-ne p1, v0, :cond_0

    return-object p0

    :cond_0
    new-instance v0, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;

    iget-object v1, p0, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->myUrl:Ljava/lang/String;

    iget-object v2, p0, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->myAttributes:Lcom/vladsch/flexmark/util/html/Attributes;

    iget-object v3, p0, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->myStatus:Lcom/vladsch/flexmark/html/renderer/LinkStatus;

    invoke-direct {v0, p1, v1, v2, v3}, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;-><init>(Lcom/vladsch/flexmark/html/renderer/LinkType;Ljava/lang/CharSequence;Lcom/vladsch/flexmark/util/html/Attributes;Lcom/vladsch/flexmark/html/renderer/LinkStatus;)V

    return-object v0
.end method

.method public withStatus(Lcom/vladsch/flexmark/html/renderer/LinkStatus;)Lcom/vladsch/flexmark/html/renderer/ResolvedLink;
    .locals 4

    .line 42
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->myStatus:Lcom/vladsch/flexmark/html/renderer/LinkStatus;

    if-ne p1, v0, :cond_0

    return-object p0

    :cond_0
    new-instance v0, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;

    iget-object v1, p0, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->myLinkType:Lcom/vladsch/flexmark/html/renderer/LinkType;

    iget-object v2, p0, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->myUrl:Ljava/lang/String;

    iget-object v3, p0, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->myAttributes:Lcom/vladsch/flexmark/util/html/Attributes;

    invoke-direct {v0, v1, v2, v3, p1}, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;-><init>(Lcom/vladsch/flexmark/html/renderer/LinkType;Ljava/lang/CharSequence;Lcom/vladsch/flexmark/util/html/Attributes;Lcom/vladsch/flexmark/html/renderer/LinkStatus;)V

    return-object v0
.end method

.method public withTarget(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/html/renderer/ResolvedLink;
    .locals 4

    .line 81
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->myAttributes:Lcom/vladsch/flexmark/util/html/Attributes;

    const/4 v1, 0x0

    const-string v2, "target"

    if-nez v0, :cond_0

    move-object v0, v1

    goto :goto_0

    :cond_0
    invoke-virtual {v0, v2}, Lcom/vladsch/flexmark/util/html/Attributes;->getValue(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    if-eq p1, v0, :cond_4

    if-eqz v0, :cond_1

    .line 82
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_2

    .line 84
    :cond_1
    new-instance v0, Lcom/vladsch/flexmark/util/html/Attributes;

    iget-object v3, p0, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->myAttributes:Lcom/vladsch/flexmark/util/html/Attributes;

    invoke-direct {v0, v3}, Lcom/vladsch/flexmark/util/html/Attributes;-><init>(Lcom/vladsch/flexmark/util/html/Attributes;)V

    if-nez p1, :cond_2

    .line 86
    invoke-virtual {v0, v2}, Lcom/vladsch/flexmark/util/html/Attributes;->remove(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/Attribute;

    .line 87
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/html/Attributes;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_1

    .line 89
    :cond_2
    invoke-virtual {v0, v2, p1}, Lcom/vladsch/flexmark/util/html/Attributes;->replaceValue(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/Attribute;

    :cond_3
    move-object v1, v0

    .line 91
    :goto_1
    new-instance p1, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;

    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->myLinkType:Lcom/vladsch/flexmark/html/renderer/LinkType;

    iget-object v2, p0, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->myUrl:Ljava/lang/String;

    iget-object v3, p0, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->myStatus:Lcom/vladsch/flexmark/html/renderer/LinkStatus;

    invoke-direct {p1, v0, v2, v1, v3}, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;-><init>(Lcom/vladsch/flexmark/html/renderer/LinkType;Ljava/lang/CharSequence;Lcom/vladsch/flexmark/util/html/Attributes;Lcom/vladsch/flexmark/html/renderer/LinkStatus;)V

    return-object p1

    :cond_4
    :goto_2
    return-object p0
.end method

.method public withTitle(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/html/renderer/ResolvedLink;
    .locals 4

    .line 63
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->myAttributes:Lcom/vladsch/flexmark/util/html/Attributes;

    const/4 v1, 0x0

    const-string v2, "title"

    if-nez v0, :cond_0

    move-object v0, v1

    goto :goto_0

    :cond_0
    invoke-virtual {v0, v2}, Lcom/vladsch/flexmark/util/html/Attributes;->getValue(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    if-eq p1, v0, :cond_4

    if-eqz v0, :cond_1

    .line 64
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_2

    .line 66
    :cond_1
    new-instance v0, Lcom/vladsch/flexmark/util/html/Attributes;

    iget-object v3, p0, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->myAttributes:Lcom/vladsch/flexmark/util/html/Attributes;

    invoke-direct {v0, v3}, Lcom/vladsch/flexmark/util/html/Attributes;-><init>(Lcom/vladsch/flexmark/util/html/Attributes;)V

    if-nez p1, :cond_2

    .line 68
    invoke-virtual {v0, v2}, Lcom/vladsch/flexmark/util/html/Attributes;->remove(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/Attribute;

    .line 69
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/html/Attributes;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_1

    .line 71
    :cond_2
    invoke-virtual {v0, v2, p1}, Lcom/vladsch/flexmark/util/html/Attributes;->replaceValue(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/Attribute;

    :cond_3
    move-object v1, v0

    .line 73
    :goto_1
    new-instance p1, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;

    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->myLinkType:Lcom/vladsch/flexmark/html/renderer/LinkType;

    iget-object v2, p0, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->myUrl:Ljava/lang/String;

    iget-object v3, p0, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->myStatus:Lcom/vladsch/flexmark/html/renderer/LinkStatus;

    invoke-direct {p1, v0, v2, v1, v3}, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;-><init>(Lcom/vladsch/flexmark/html/renderer/LinkType;Ljava/lang/CharSequence;Lcom/vladsch/flexmark/util/html/Attributes;Lcom/vladsch/flexmark/html/renderer/LinkStatus;)V

    return-object p1

    :cond_4
    :goto_2
    return-object p0
.end method

.method public withUrl(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/html/renderer/ResolvedLink;
    .locals 4

    .line 54
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 55
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->myUrl:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p0

    :cond_0
    new-instance v0, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;

    iget-object v1, p0, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->myLinkType:Lcom/vladsch/flexmark/html/renderer/LinkType;

    iget-object v2, p0, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->myAttributes:Lcom/vladsch/flexmark/util/html/Attributes;

    iget-object v3, p0, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->myStatus:Lcom/vladsch/flexmark/html/renderer/LinkStatus;

    invoke-direct {v0, v1, p1, v2, v3}, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;-><init>(Lcom/vladsch/flexmark/html/renderer/LinkType;Ljava/lang/CharSequence;Lcom/vladsch/flexmark/util/html/Attributes;Lcom/vladsch/flexmark/html/renderer/LinkStatus;)V

    return-object v0
.end method
