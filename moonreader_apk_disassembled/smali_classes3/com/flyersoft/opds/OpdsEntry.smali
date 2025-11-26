.class public Lcom/flyersoft/opds/OpdsEntry;
.super Ljava/lang/Object;
.source "OpdsEntry.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/opds/OpdsEntry$BookUrl;,
        Lcom/flyersoft/opds/OpdsEntry$RelatedItem;
    }
.end annotation


# instance fields
.field public author:Ljava/lang/String;

.field public content:Ljava/lang/String;

.field public contentType:Ljava/lang/String;

.field public cover:Ljava/lang/String;

.field public id:Ljava/lang/String;

.field public linkHref:Ljava/lang/String;

.field public linkType:Ljava/lang/String;

.field public password:Ljava/lang/String;

.field public relatedList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/opds/OpdsEntry$RelatedItem;",
            ">;"
        }
    .end annotation
.end field

.field public selectedUrlIndex:I

.field public thumbIsBase64:Z

.field public thumbnail:Ljava/lang/String;

.field public title:Ljava/lang/String;

.field public udpated:Ljava/lang/String;

.field public urls:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/opds/OpdsEntry$BookUrl;",
            ">;"
        }
    .end annotation
.end field

.field public user_agent:Ljava/lang/String;

.field public username:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    const-string v0, ""

    iput-object v0, p0, Lcom/flyersoft/opds/OpdsEntry;->username:Ljava/lang/String;

    .line 9
    iput-object v0, p0, Lcom/flyersoft/opds/OpdsEntry;->password:Ljava/lang/String;

    .line 10
    iput-object v0, p0, Lcom/flyersoft/opds/OpdsEntry;->title:Ljava/lang/String;

    .line 11
    iput-object v0, p0, Lcom/flyersoft/opds/OpdsEntry;->linkType:Ljava/lang/String;

    .line 12
    iput-object v0, p0, Lcom/flyersoft/opds/OpdsEntry;->linkHref:Ljava/lang/String;

    .line 13
    iput-object v0, p0, Lcom/flyersoft/opds/OpdsEntry;->id:Ljava/lang/String;

    .line 14
    iput-object v0, p0, Lcom/flyersoft/opds/OpdsEntry;->udpated:Ljava/lang/String;

    .line 15
    iput-object v0, p0, Lcom/flyersoft/opds/OpdsEntry;->content:Ljava/lang/String;

    .line 16
    iput-object v0, p0, Lcom/flyersoft/opds/OpdsEntry;->contentType:Ljava/lang/String;

    .line 17
    iput-object v0, p0, Lcom/flyersoft/opds/OpdsEntry;->thumbnail:Ljava/lang/String;

    const/4 v1, 0x0

    .line 18
    iput-boolean v1, p0, Lcom/flyersoft/opds/OpdsEntry;->thumbIsBase64:Z

    .line 19
    iput-object v0, p0, Lcom/flyersoft/opds/OpdsEntry;->cover:Ljava/lang/String;

    .line 21
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    const/4 v1, -0x1

    .line 22
    iput v1, p0, Lcom/flyersoft/opds/OpdsEntry;->selectedUrlIndex:I

    .line 37
    iput-object v0, p0, Lcom/flyersoft/opds/OpdsEntry;->author:Ljava/lang/String;

    .line 38
    const-string v0, "OPDS/Stanza iPhone/Aldiko/Moon+ Reader(Android)"

    iput-object v0, p0, Lcom/flyersoft/opds/OpdsEntry;->user_agent:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getSelectedUrl()Ljava/lang/String;
    .locals 5

    .line 26
    iget v0, p0, Lcom/flyersoft/opds/OpdsEntry;->selectedUrlIndex:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_2

    iget-object v0, p0, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_2

    const/4 v0, 0x0

    const/4 v2, 0x0

    .line 27
    :goto_0
    iget-object v3, p0, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 28
    iget-object v3, p0, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/opds/OpdsEntry$BookUrl;

    iget-object v3, v3, Lcom/flyersoft/opds/OpdsEntry$BookUrl;->type:Ljava/lang/String;

    const-string v4, "epub"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 29
    iput v2, p0, Lcom/flyersoft/opds/OpdsEntry;->selectedUrlIndex:I

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 30
    :cond_1
    iget v2, p0, Lcom/flyersoft/opds/OpdsEntry;->selectedUrlIndex:I

    if-ne v2, v1, :cond_2

    .line 31
    iput v0, p0, Lcom/flyersoft/opds/OpdsEntry;->selectedUrlIndex:I

    .line 33
    :cond_2
    iget v0, p0, Lcom/flyersoft/opds/OpdsEntry;->selectedUrlIndex:I

    if-eq v0, v1, :cond_3

    .line 34
    iget-object v1, p0, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/opds/OpdsEntry$BookUrl;

    iget-object v0, v0, Lcom/flyersoft/opds/OpdsEntry$BookUrl;->href:Ljava/lang/String;

    goto :goto_1

    :cond_3
    const/4 v0, 0x0

    :goto_1
    if-eqz v0, :cond_4

    return-object v0

    .line 35
    :cond_4
    const-string v0, ""

    return-object v0
.end method

.method public itemIconRes()I
    .locals 3

    .line 78
    iget-object v0, p0, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_1c

    .line 79
    iget-object v0, p0, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/opds/OpdsEntry$BookUrl;

    .line 80
    iget-object v1, v1, Lcom/flyersoft/opds/OpdsEntry$BookUrl;->type:Ljava/lang/String;

    const-string v2, "epub"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 81
    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->aiepub:I

    return v0

    .line 82
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/opds/OpdsEntry$BookUrl;

    .line 83
    iget-object v1, v1, Lcom/flyersoft/opds/OpdsEntry$BookUrl;->type:Ljava/lang/String;

    const-string v2, "mobi"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 84
    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->aimobi:I

    return v0

    .line 85
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/opds/OpdsEntry$BookUrl;

    .line 86
    iget-object v1, v1, Lcom/flyersoft/opds/OpdsEntry$BookUrl;->type:Ljava/lang/String;

    const-string v2, "azw3"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 87
    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->aiazw:I

    return v0

    .line 88
    :cond_5
    iget-object v0, p0, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/opds/OpdsEntry$BookUrl;

    .line 89
    iget-object v1, v1, Lcom/flyersoft/opds/OpdsEntry$BookUrl;->type:Ljava/lang/String;

    const-string v2, "fb2"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 90
    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->aifb2:I

    return v0

    .line 91
    :cond_7
    iget-object v0, p0, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_9

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/opds/OpdsEntry$BookUrl;

    .line 92
    iget-object v1, v1, Lcom/flyersoft/opds/OpdsEntry$BookUrl;->type:Ljava/lang/String;

    const-string v2, "cbr"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 93
    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->aicbr:I

    return v0

    .line 94
    :cond_9
    iget-object v0, p0, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/opds/OpdsEntry$BookUrl;

    .line 95
    iget-object v1, v1, Lcom/flyersoft/opds/OpdsEntry$BookUrl;->type:Ljava/lang/String;

    const-string v2, "cbz"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 96
    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->aicbz:I

    return v0

    .line 97
    :cond_b
    iget-object v0, p0, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/opds/OpdsEntry$BookUrl;

    .line 98
    iget-object v1, v1, Lcom/flyersoft/opds/OpdsEntry$BookUrl;->type:Ljava/lang/String;

    const-string v2, "pdf"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_c

    .line 99
    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->aipdf:I

    return v0

    .line 100
    :cond_d
    iget-object v0, p0, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/opds/OpdsEntry$BookUrl;

    .line 101
    iget-object v1, v1, Lcom/flyersoft/opds/OpdsEntry$BookUrl;->type:Ljava/lang/String;

    const-string v2, "txt"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 102
    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->aitxt:I

    return v0

    .line 103
    :cond_f
    iget-object v0, p0, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_10
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_11

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/opds/OpdsEntry$BookUrl;

    .line 104
    iget-object v1, v1, Lcom/flyersoft/opds/OpdsEntry$BookUrl;->type:Ljava/lang/String;

    const-string v2, "djvu"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_10

    .line 105
    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->aidjvu:I

    return v0

    .line 106
    :cond_11
    iget-object v0, p0, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_12
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_13

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/opds/OpdsEntry$BookUrl;

    .line 107
    iget-object v1, v1, Lcom/flyersoft/opds/OpdsEntry$BookUrl;->type:Ljava/lang/String;

    const-string v2, "docx"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_12

    .line 108
    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->aidocx:I

    return v0

    .line 109
    :cond_13
    iget-object v0, p0, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_14
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_15

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/opds/OpdsEntry$BookUrl;

    .line 110
    iget-object v1, v1, Lcom/flyersoft/opds/OpdsEntry$BookUrl;->type:Ljava/lang/String;

    const-string v2, "md"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_14

    .line 111
    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->aimd:I

    return v0

    .line 112
    :cond_15
    iget-object v0, p0, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_16
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_17

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/opds/OpdsEntry$BookUrl;

    .line 113
    iget-object v1, v1, Lcom/flyersoft/opds/OpdsEntry$BookUrl;->type:Ljava/lang/String;

    const-string v2, "odt"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_16

    .line 114
    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->aiodt:I

    return v0

    .line 115
    :cond_17
    iget-object v0, p0, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_18
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_19

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/opds/OpdsEntry$BookUrl;

    .line 116
    iget-object v1, v1, Lcom/flyersoft/opds/OpdsEntry$BookUrl;->type:Ljava/lang/String;

    const-string v2, "rtf"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_18

    .line 117
    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->airtf:I

    return v0

    .line 118
    :cond_19
    iget-object v0, p0, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/opds/OpdsEntry$BookUrl;

    .line 119
    iget-object v1, v1, Lcom/flyersoft/opds/OpdsEntry$BookUrl;->type:Ljava/lang/String;

    const-string v2, "mhtml"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 120
    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->aimht:I

    return v0

    .line 121
    :cond_1b
    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->aiunknow:I

    return v0

    .line 123
    :cond_1c
    iget-object v0, p0, Lcom/flyersoft/opds/OpdsEntry;->linkType:Ljava/lang/String;

    const-string v1, "atom"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1d

    .line 124
    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->aiweb:I

    return v0

    .line 126
    :cond_1d
    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->network_library:I

    return v0
.end method

.method public itemType()I
    .locals 2

    .line 69
    iget-object v0, p0, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 72
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/opds/OpdsEntry;->linkType:Ljava/lang/String;

    const-string v1, "atom"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    const/4 v0, 0x1

    return v0

    :cond_1
    const/4 v0, 0x2

    return v0
.end method
