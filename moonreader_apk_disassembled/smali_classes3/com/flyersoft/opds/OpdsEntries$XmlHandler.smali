.class public Lcom/flyersoft/opds/OpdsEntries$XmlHandler;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "OpdsEntries.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/opds/OpdsEntries;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "XmlHandler"
.end annotation


# instance fields
.field aTmpHref:Ljava/lang/String;

.field agentStart:Z

.field authorStart:Z

.field contentIsText:Z

.field contentStart:Z

.field entry:Lcom/flyersoft/opds/OpdsEntry;

.field hasBaseUrl:Z

.field nodeName:Ljava/lang/String;

.field summary:Ljava/lang/String;

.field final synthetic this$0:Lcom/flyersoft/opds/OpdsEntries;

.field titleStart:Z


# direct methods
.method public constructor <init>(Lcom/flyersoft/opds/OpdsEntries;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 113
    iput-object p1, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->this$0:Lcom/flyersoft/opds/OpdsEntries;

    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    const/4 p1, 0x0

    .line 116
    iput-object p1, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    .line 117
    const-string p1, ""

    iput-object p1, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->summary:Ljava/lang/String;

    const/4 p1, 0x0

    .line 120
    iput-boolean p1, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->titleStart:Z

    .line 121
    iput-boolean p1, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->agentStart:Z

    .line 123
    iput-boolean p1, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->contentStart:Z

    .line 124
    iput-boolean p1, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->contentIsText:Z

    .line 125
    iput-boolean p1, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->authorStart:Z

    .line 126
    iput-boolean p1, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->hasBaseUrl:Z

    return-void
.end method

.method private getSearchUrl(Ljava/lang/String;)V
    .locals 2

    .line 350
    iget-object v0, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->this$0:Lcom/flyersoft/opds/OpdsEntries;

    iget-object v0, v0, Lcom/flyersoft/opds/OpdsEntries;->library:Lcom/flyersoft/opds/OpdsSite;

    if-nez v0, :cond_0

    goto :goto_0

    .line 352
    :cond_0
    const-string v0, ".feedbooks.com"

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->this$0:Lcom/flyersoft/opds/OpdsEntries;

    iget-object v0, v0, Lcom/flyersoft/opds/OpdsEntries;->library:Lcom/flyersoft/opds/OpdsSite;

    iget-object v0, v0, Lcom/flyersoft/opds/OpdsSite;->searchUrl:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    .line 355
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->this$0:Lcom/flyersoft/opds/OpdsEntries;

    iget-object v0, v0, Lcom/flyersoft/opds/OpdsEntries;->library:Lcom/flyersoft/opds/OpdsSite;

    iget-object v0, v0, Lcom/flyersoft/opds/OpdsSite;->openSearchUrl:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    :goto_0
    return-void

    .line 357
    :cond_2
    new-instance v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler$1;

    invoke-direct {v0, p0, p1}, Lcom/flyersoft/opds/OpdsEntries$XmlHandler$1;-><init>(Lcom/flyersoft/opds/OpdsEntries$XmlHandler;Ljava/lang/String;)V

    const/4 p1, 0x1

    .line 390
    invoke-virtual {v0, p1}, Ljava/lang/Thread;->setPriority(I)V

    .line 391
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method private isValidateUrl(Ljava/lang/String;)Z
    .locals 5

    const/4 v0, 0x1

    .line 395
    const-string v1, "://"

    const/4 v2, 0x0

    if-eqz p1, :cond_0

    const-string v3, "http"

    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 396
    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_0

    const-string v3, "drinkmalk.com"

    invoke-virtual {p1, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-ne v3, v4, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    if-eqz v3, :cond_3

    .line 398
    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v3, 0x3

    add-int/2addr v1, v3

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 399
    const-string v1, "/"

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-lez v1, :cond_1

    .line 401
    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 402
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-le v1, v3, :cond_2

    const-string v1, "."

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p1

    if-lez p1, :cond_2

    return v0

    :cond_2
    return v2

    :cond_3
    return v3
.end method

.method private stringToHtml(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 1

    if-eqz p2, :cond_0

    .line 470
    const-string p2, "\n"

    const-string v0, "<br>"

    invoke-virtual {p1, p2, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    :cond_0
    return-object p1
.end method


# virtual methods
.method public characters([CII)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 477
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 478
    iget-object p2, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->this$0:Lcom/flyersoft/opds/OpdsEntries;

    iget-object p2, p2, Lcom/flyersoft/opds/OpdsEntries;->xml_title:Ljava/lang/String;

    if-nez p2, :cond_0

    const-string p2, "title"

    iget-object p3, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->nodeName:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 479
    iget-object p2, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->this$0:Lcom/flyersoft/opds/OpdsEntries;

    iput-object p1, p2, Lcom/flyersoft/opds/OpdsEntries;->xml_title:Ljava/lang/String;

    .line 480
    :cond_0
    iget-object p2, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->this$0:Lcom/flyersoft/opds/OpdsEntries;

    iget-object p2, p2, Lcom/flyersoft/opds/OpdsEntries;->xml_subtitle:Ljava/lang/String;

    if-nez p2, :cond_1

    const-string p2, "subtitle"

    iget-object p3, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->nodeName:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_1

    .line 481
    iget-object p2, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->this$0:Lcom/flyersoft/opds/OpdsEntries;

    iput-object p1, p2, Lcom/flyersoft/opds/OpdsEntries;->xml_subtitle:Ljava/lang/String;

    .line 483
    :cond_1
    iget-object p2, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    if-eqz p2, :cond_8

    .line 484
    iget-boolean p3, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->titleStart:Z

    if-eqz p3, :cond_2

    .line 485
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v0, v0, Lcom/flyersoft/opds/OpdsEntry;->title:Ljava/lang/String;

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    iput-object p3, p2, Lcom/flyersoft/opds/OpdsEntry;->title:Ljava/lang/String;

    .line 486
    :cond_2
    iget-boolean p2, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->agentStart:Z

    if-eqz p2, :cond_3

    .line 487
    iget-object p2, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iput-object p1, p2, Lcom/flyersoft/opds/OpdsEntry;->user_agent:Ljava/lang/String;

    .line 488
    :cond_3
    iget-boolean p2, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->contentStart:Z

    if-eqz p2, :cond_4

    .line 489
    iget-object p2, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v0, v0, Lcom/flyersoft/opds/OpdsEntry;->content:Ljava/lang/String;

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    iput-object p3, p2, Lcom/flyersoft/opds/OpdsEntry;->content:Ljava/lang/String;

    .line 490
    :cond_4
    iget-boolean p2, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->authorStart:Z

    if-eqz p2, :cond_5

    .line 491
    iget-object p2, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v0, v0, Lcom/flyersoft/opds/OpdsEntry;->author:Ljava/lang/String;

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    iput-object p3, p2, Lcom/flyersoft/opds/OpdsEntry;->author:Ljava/lang/String;

    .line 493
    :cond_5
    const-string p2, "id"

    iget-object p3, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->nodeName:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_6

    .line 494
    iget-object p2, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v0, v0, Lcom/flyersoft/opds/OpdsEntry;->id:Ljava/lang/String;

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    iput-object p3, p2, Lcom/flyersoft/opds/OpdsEntry;->id:Ljava/lang/String;

    .line 495
    :cond_6
    const-string p2, "updated"

    iget-object p3, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->nodeName:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_7

    .line 496
    iget-object p2, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v0, v0, Lcom/flyersoft/opds/OpdsEntry;->udpated:Ljava/lang/String;

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    iput-object p3, p2, Lcom/flyersoft/opds/OpdsEntry;->udpated:Ljava/lang/String;

    .line 497
    :cond_7
    const-string p2, "summary"

    iget-object p3, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->nodeName:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_8

    .line 498
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p3, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->summary:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->summary:Ljava/lang/String;

    .line 501
    :cond_8
    iget-object p2, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->this$0:Lcom/flyersoft/opds/OpdsEntries;

    iget p2, p2, Lcom/flyersoft/opds/OpdsEntries;->totalResults:I

    const/4 p3, 0x0

    if-nez p2, :cond_9

    const-string p2, "totalResults"

    iget-object v0, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->nodeName:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_9

    .line 503
    :try_start_0
    iget-object p2, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->this$0:Lcom/flyersoft/opds/OpdsEntries;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p2, Lcom/flyersoft/opds/OpdsEntries;->totalResults:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 505
    :catch_0
    iget-object p2, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->this$0:Lcom/flyersoft/opds/OpdsEntries;

    iput p3, p2, Lcom/flyersoft/opds/OpdsEntries;->totalResults:I

    .line 508
    :cond_9
    :goto_0
    iget-object p2, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->this$0:Lcom/flyersoft/opds/OpdsEntries;

    iget p2, p2, Lcom/flyersoft/opds/OpdsEntries;->itemsPerPage:I

    if-nez p2, :cond_a

    const-string p2, "itemsPerPage"

    iget-object v0, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->nodeName:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_a

    .line 510
    :try_start_1
    iget-object p2, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->this$0:Lcom/flyersoft/opds/OpdsEntries;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iput p1, p2, Lcom/flyersoft/opds/OpdsEntries;->itemsPerPage:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 512
    :catch_1
    iget-object p1, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->this$0:Lcom/flyersoft/opds/OpdsEntries;

    iput p3, p1, Lcom/flyersoft/opds/OpdsEntries;->itemsPerPage:I

    :cond_a
    :goto_1
    return-void
.end method

.method public dealContent(Lcom/flyersoft/opds/OpdsEntry;)V
    .locals 3

    .line 462
    iget-object v0, p1, Lcom/flyersoft/opds/OpdsEntry;->content:Ljava/lang/String;

    iget-boolean v1, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->contentIsText:Z

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->stringToHtml(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/flyersoft/opds/OpdsEntry;->content:Ljava/lang/String;

    .line 463
    iget-object v0, p1, Lcom/flyersoft/opds/OpdsEntry;->content:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xa

    if-ge v0, v1, :cond_0

    iget-object v0, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->summary:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, v1, :cond_0

    .line 464
    iget-object v0, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->summary:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->stringToHtml(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/flyersoft/opds/OpdsEntry;->content:Ljava/lang/String;

    .line 465
    :cond_0
    iget-object v0, p1, Lcom/flyersoft/opds/OpdsEntry;->content:Ljava/lang/String;

    const-string v1, "<img></img>"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/flyersoft/opds/OpdsEntry;->content:Ljava/lang/String;

    return-void
.end method

.method public endDocument()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    return-void
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 411
    const-string p1, "title"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    const/4 p3, 0x0

    if-eqz p1, :cond_0

    .line 412
    iput-boolean p3, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->titleStart:Z

    .line 413
    :cond_0
    const-string p1, "agent"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 414
    iput-boolean p3, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->agentStart:Z

    .line 415
    :cond_1
    const-string p1, "content"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 416
    iput-boolean p3, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->contentStart:Z

    .line 417
    :cond_2
    iget-boolean p1, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->contentStart:Z

    if-eqz p1, :cond_3

    iget-boolean p1, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->contentIsText:Z

    if-nez p1, :cond_3

    .line 418
    iget-object p1, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v1, v1, Lcom/flyersoft/opds/OpdsEntry;->content:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "</"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/flyersoft/opds/OpdsEntry;->content:Ljava/lang/String;

    .line 419
    :cond_3
    const-string p1, "name"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 420
    iput-boolean p3, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->authorStart:Z

    .line 422
    :cond_4
    const-string p1, "entry"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_d

    .line 423
    iget-object p1, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    if-eqz p1, :cond_d

    .line 424
    iget-object p2, p1, Lcom/flyersoft/opds/OpdsEntry;->author:Ljava/lang/String;

    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p1, Lcom/flyersoft/opds/OpdsEntry;->author:Ljava/lang/String;

    .line 425
    iget-object p1, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iget-object p2, p1, Lcom/flyersoft/opds/OpdsEntry;->title:Ljava/lang/String;

    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p1, Lcom/flyersoft/opds/OpdsEntry;->title:Ljava/lang/String;

    .line 427
    iget-object p1, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    invoke-virtual {p0, p1}, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->dealContent(Lcom/flyersoft/opds/OpdsEntry;)V

    .line 429
    iget-object p1, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iget-object p1, p1, Lcom/flyersoft/opds/OpdsEntry;->linkHref:Ljava/lang/String;

    const-string p2, ""

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->aTmpHref:Ljava/lang/String;

    if-eqz p1, :cond_5

    .line 430
    iget-object v0, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->UrlEncode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, v0, Lcom/flyersoft/opds/OpdsEntry;->linkHref:Ljava/lang/String;

    .line 432
    :cond_5
    iget-object p1, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->this$0:Lcom/flyersoft/opds/OpdsEntries;

    invoke-static {p1}, Lcom/flyersoft/opds/OpdsEntries;->-$$Nest$fgetbaseUrl(Lcom/flyersoft/opds/OpdsEntries;)Ljava/lang/String;

    move-result-object p1

    .line 433
    iget-object v0, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v0, v0, Lcom/flyersoft/opds/OpdsEntry;->linkHref:Ljava/lang/String;

    const-string v1, "http"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_6

    .line 434
    iget-object v0, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v2, v0, Lcom/flyersoft/opds/OpdsEntry;->linkHref:Ljava/lang/String;

    invoke-static {p1, v2}, Lcom/flyersoft/tools/T;->mergeHref(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/T;->UrlEncode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, v0, Lcom/flyersoft/opds/OpdsEntry;->linkHref:Ljava/lang/String;

    .line 436
    :cond_6
    iget-object p1, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iget-boolean p1, p1, Lcom/flyersoft/opds/OpdsEntry;->thumbIsBase64:Z

    if-nez p1, :cond_7

    iget-object p1, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iget-object p1, p1, Lcom/flyersoft/opds/OpdsEntry;->thumbnail:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_7

    iget-object p1, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iget-object p1, p1, Lcom/flyersoft/opds/OpdsEntry;->thumbnail:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_7

    .line 437
    iget-object p1, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v0, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->this$0:Lcom/flyersoft/opds/OpdsEntries;

    invoke-static {v0}, Lcom/flyersoft/opds/OpdsEntries;->-$$Nest$fgetbaseUrl(Lcom/flyersoft/opds/OpdsEntries;)Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v2, v2, Lcom/flyersoft/opds/OpdsEntry;->thumbnail:Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/flyersoft/tools/T;->mergeHref(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/flyersoft/opds/OpdsEntry;->thumbnail:Ljava/lang/String;

    .line 438
    :cond_7
    iget-object p1, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iget-object p1, p1, Lcom/flyersoft/opds/OpdsEntry;->cover:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_8

    .line 439
    iget-object p1, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v0, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->this$0:Lcom/flyersoft/opds/OpdsEntries;

    invoke-static {v0}, Lcom/flyersoft/opds/OpdsEntries;->-$$Nest$fgetbaseUrl(Lcom/flyersoft/opds/OpdsEntries;)Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v2, v2, Lcom/flyersoft/opds/OpdsEntry;->cover:Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/flyersoft/tools/T;->mergeHref(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/flyersoft/opds/OpdsEntry;->cover:Ljava/lang/String;

    .line 440
    :cond_8
    iget-object p1, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iget-object p1, p1, Lcom/flyersoft/opds/OpdsEntry;->thumbnail:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_9

    iget-object p1, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iget-object p1, p1, Lcom/flyersoft/opds/OpdsEntry;->cover:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_9

    .line 441
    iget-object p1, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v0, p1, Lcom/flyersoft/opds/OpdsEntry;->cover:Ljava/lang/String;

    iput-object v0, p1, Lcom/flyersoft/opds/OpdsEntry;->thumbnail:Ljava/lang/String;

    .line 443
    :cond_9
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iget-object p1, p1, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-ge p3, p1, :cond_b

    .line 444
    iget-object p1, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iget-object p1, p1, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/opds/OpdsEntry$BookUrl;

    iget-object p1, p1, Lcom/flyersoft/opds/OpdsEntry$BookUrl;->href:Ljava/lang/String;

    .line 445
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_a

    .line 446
    iget-object v0, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->this$0:Lcom/flyersoft/opds/OpdsEntries;

    invoke-static {v0}, Lcom/flyersoft/opds/OpdsEntries;->-$$Nest$fgetbaseUrl(Lcom/flyersoft/opds/OpdsEntries;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/flyersoft/tools/T;->mergeHref(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 447
    iget-object v0, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v0, v0, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    invoke-virtual {v0, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/opds/OpdsEntry$BookUrl;

    iput-object p1, v0, Lcom/flyersoft/opds/OpdsEntry$BookUrl;->href:Ljava/lang/String;

    :cond_a
    add-int/lit8 p3, p3, 0x1

    goto :goto_0

    .line 450
    :cond_b
    iget-object p1, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->this$0:Lcom/flyersoft/opds/OpdsEntries;

    iget-object p1, p1, Lcom/flyersoft/opds/OpdsEntries;->library:Lcom/flyersoft/opds/OpdsSite;

    if-eqz p1, :cond_c

    .line 451
    iget-object p1, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iget-object p2, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->this$0:Lcom/flyersoft/opds/OpdsEntries;

    iget-object p2, p2, Lcom/flyersoft/opds/OpdsEntries;->library:Lcom/flyersoft/opds/OpdsSite;

    iget-object p2, p2, Lcom/flyersoft/opds/OpdsSite;->username:Ljava/lang/String;

    iput-object p2, p1, Lcom/flyersoft/opds/OpdsEntry;->username:Ljava/lang/String;

    .line 452
    iget-object p1, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iget-object p2, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->this$0:Lcom/flyersoft/opds/OpdsEntries;

    iget-object p2, p2, Lcom/flyersoft/opds/OpdsEntries;->library:Lcom/flyersoft/opds/OpdsSite;

    iget-object p2, p2, Lcom/flyersoft/opds/OpdsSite;->password:Ljava/lang/String;

    iput-object p2, p1, Lcom/flyersoft/opds/OpdsEntry;->password:Ljava/lang/String;

    .line 454
    :cond_c
    iget-object p1, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->this$0:Lcom/flyersoft/opds/OpdsEntries;

    iget-object p2, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    invoke-virtual {p1, p2}, Lcom/flyersoft/opds/OpdsEntries;->specailCheckOk(Lcom/flyersoft/opds/OpdsEntry;)Z

    move-result p1

    if-eqz p1, :cond_d

    .line 455
    iget-object p1, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->this$0:Lcom/flyersoft/opds/OpdsEntries;

    iget-object p1, p1, Lcom/flyersoft/opds/OpdsEntries;->entries:Ljava/util/ArrayList;

    iget-object p2, p0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_d
    return-void
.end method

.method public startDocument()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    return-void
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .locals 21
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p4

    .line 142
    const-string v3, "djvu"

    const-string v4, "cbr"

    const-string v5, "cbz"

    const-string v6, "fb2"

    const-string v7, "txt"

    const-string v8, "pdf"

    const-string v9, "content"

    const-string v10, "title"

    const-string v11, "href"

    :try_start_0
    const-string v12, "feed"

    invoke-virtual {v12, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v13, "http"

    if-eqz v12, :cond_1

    .line 143
    :try_start_1
    invoke-interface {v2}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v12

    const/4 v14, 0x0

    :goto_0
    if-ge v14, v12, :cond_1

    .line 145
    const-string v15, "base"

    move/from16 v16, v12

    invoke-interface {v2, v14}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v15, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    .line 146
    invoke-interface {v2, v14}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v12

    if-eqz v12, :cond_1

    .line 147
    invoke-virtual {v12, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_1

    .line 148
    iget-object v14, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->this$0:Lcom/flyersoft/opds/OpdsEntries;

    invoke-static {v14, v12}, Lcom/flyersoft/opds/OpdsEntries;->-$$Nest$fputbaseUrl(Lcom/flyersoft/opds/OpdsEntries;Ljava/lang/String;)V

    const/4 v12, 0x1

    .line 149
    iput-boolean v12, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->hasBaseUrl:Z

    goto :goto_1

    :cond_0
    add-int/lit8 v14, v14, 0x1

    move/from16 v12, v16

    goto :goto_0

    .line 157
    :cond_1
    :goto_1
    const-string v12, "rel"

    invoke-interface {v2, v12}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 158
    invoke-interface {v2, v11}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 159
    iget-boolean v15, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->hasBaseUrl:Z

    if-nez v15, :cond_2

    if-eqz v12, :cond_2

    .line 160
    const-string v15, "self"

    invoke-virtual {v12, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_2

    .line 161
    invoke-direct {v0, v14}, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->isValidateUrl(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_2

    .line 162
    iget-object v15, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->this$0:Lcom/flyersoft/opds/OpdsEntries;

    invoke-static {v15, v14}, Lcom/flyersoft/opds/OpdsEntries;->-$$Nest$fputbaseUrl(Lcom/flyersoft/opds/OpdsEntries;Ljava/lang/String;)V

    .line 165
    :cond_2
    iget-object v15, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->this$0:Lcom/flyersoft/opds/OpdsEntries;

    iget-object v15, v15, Lcom/flyersoft/opds/OpdsEntries;->library:Lcom/flyersoft/opds/OpdsSite;

    move-object/from16 v16, v15

    if-eqz v16, :cond_5

    iget-object v15, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->this$0:Lcom/flyersoft/opds/OpdsEntries;

    iget-object v15, v15, Lcom/flyersoft/opds/OpdsEntries;->library:Lcom/flyersoft/opds/OpdsSite;

    iget-boolean v15, v15, Lcom/flyersoft/opds/OpdsSite;->lock_search_url:Z

    if-nez v15, :cond_5

    if-eqz v12, :cond_5

    .line 166
    const-string v15, "search"

    invoke-virtual {v12, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_5

    .line 167
    iget-object v15, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->this$0:Lcom/flyersoft/opds/OpdsEntries;

    invoke-static {v15}, Lcom/flyersoft/opds/OpdsEntries;->-$$Nest$fgetbaseUrl(Lcom/flyersoft/opds/OpdsEntries;)Ljava/lang/String;

    move-result-object v15

    invoke-static {v15, v14}, Lcom/flyersoft/tools/T;->mergeHref(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    if-eqz v14, :cond_3

    move-object/from16 v17, v3

    .line 168
    const-string v3, "{searchTerms}"

    invoke-virtual {v14, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    move-object/from16 v18, v4

    const/4 v4, -0x1

    if-eq v3, v4, :cond_4

    .line 169
    iget-object v3, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->this$0:Lcom/flyersoft/opds/OpdsEntries;

    iget-object v3, v3, Lcom/flyersoft/opds/OpdsEntries;->library:Lcom/flyersoft/opds/OpdsSite;

    iput-object v15, v3, Lcom/flyersoft/opds/OpdsSite;->searchUrl:Ljava/lang/String;

    goto :goto_2

    :cond_3
    move-object/from16 v17, v3

    move-object/from16 v18, v4

    .line 171
    :cond_4
    invoke-direct {v0, v15}, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->getSearchUrl(Ljava/lang/String;)V

    goto :goto_2

    :cond_5
    move-object/from16 v17, v3

    move-object/from16 v18, v4

    .line 175
    :goto_2
    iget-object v3, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->this$0:Lcom/flyersoft/opds/OpdsEntries;

    iget-object v3, v3, Lcom/flyersoft/opds/OpdsEntries;->nextUrl:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    const-string v4, "link"

    if-nez v3, :cond_6

    :try_start_2
    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    if-eqz v12, :cond_6

    .line 176
    const-string v3, "next"

    invoke-virtual {v12, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 177
    iget-object v3, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->this$0:Lcom/flyersoft/opds/OpdsEntries;

    invoke-interface {v2, v11}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    iput-object v15, v3, Lcom/flyersoft/opds/OpdsEntries;->nextUrl:Ljava/lang/String;

    .line 178
    iget-object v3, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->this$0:Lcom/flyersoft/opds/OpdsEntries;

    iget-object v3, v3, Lcom/flyersoft/opds/OpdsEntries;->nextUrl:Ljava/lang/String;

    if-eqz v3, :cond_6

    iget-object v3, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->this$0:Lcom/flyersoft/opds/OpdsEntries;

    iget-object v3, v3, Lcom/flyersoft/opds/OpdsEntries;->nextUrl:Ljava/lang/String;

    invoke-virtual {v3, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_6

    .line 179
    iget-object v3, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->this$0:Lcom/flyersoft/opds/OpdsEntries;

    invoke-static {v3}, Lcom/flyersoft/opds/OpdsEntries;->-$$Nest$fgetbaseUrl(Lcom/flyersoft/opds/OpdsEntries;)Ljava/lang/String;

    move-result-object v13

    iget-object v15, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->this$0:Lcom/flyersoft/opds/OpdsEntries;

    iget-object v15, v15, Lcom/flyersoft/opds/OpdsEntries;->nextUrl:Ljava/lang/String;

    invoke-static {v13, v15}, Lcom/flyersoft/tools/T;->mergeHref(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    iput-object v13, v3, Lcom/flyersoft/opds/OpdsEntries;->nextUrl:Ljava/lang/String;

    .line 184
    :cond_6
    invoke-virtual {v10, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    const/4 v3, 0x1

    .line 185
    iput-boolean v3, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->titleStart:Z

    goto :goto_3

    :cond_7
    const/4 v3, 0x1

    .line 186
    :goto_3
    const-string v13, "agent"

    invoke-virtual {v13, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_8

    .line 187
    iput-boolean v3, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->agentStart:Z

    .line 191
    :cond_8
    iget-boolean v3, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->contentStart:Z

    if-eqz v3, :cond_c

    iget-boolean v3, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->contentIsText:Z

    if-nez v3, :cond_c

    .line 193
    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    const-string v15, "a"

    invoke-virtual {v3, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 194
    invoke-interface {v2, v11}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_a

    .line 196
    const-string v3, "HREF"

    invoke-interface {v2, v3}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_4

    :cond_9
    const/4 v3, 0x0

    .line 198
    :cond_a
    :goto_4
    iget-object v15, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v19, v10

    iget-object v10, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v10, v10, Lcom/flyersoft/opds/OpdsEntry;->content:Ljava/lang/String;

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v10, "<"

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez v3, :cond_b

    const-string v3, ">"

    move-object/from16 v20, v12

    goto :goto_5

    :cond_b
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v20, v12

    const-string v12, " href=\""

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\">"

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_5
    invoke-virtual {v13, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/flyersoft/opds/OpdsEntry;->content:Ljava/lang/String;

    goto :goto_6

    :cond_c
    move-object/from16 v19, v10

    move-object/from16 v20, v12

    .line 200
    :goto_6
    invoke-virtual {v9, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    const-string v10, "type"

    if-eqz v3, :cond_e

    const/4 v12, 0x1

    .line 201
    :try_start_3
    iput-boolean v12, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->contentStart:Z

    .line 202
    invoke-interface {v2, v10}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_d

    .line 203
    const-string v12, "text"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_d

    const/4 v3, 0x1

    goto :goto_7

    :cond_d
    const/4 v3, 0x0

    :goto_7
    iput-boolean v3, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->contentIsText:Z

    .line 206
    :cond_e
    const-string v3, "name"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_f

    const/4 v12, 0x1

    .line 207
    iput-boolean v12, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->authorStart:Z

    .line 209
    :cond_f
    iput-object v1, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->nodeName:Ljava/lang/String;

    .line 210
    const-string v3, "entry"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_10

    .line 211
    new-instance v3, Lcom/flyersoft/opds/OpdsEntry;

    invoke-direct {v3}, Lcom/flyersoft/opds/OpdsEntry;-><init>()V

    iput-object v3, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    .line 212
    iget-object v12, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->this$0:Lcom/flyersoft/opds/OpdsEntries;

    invoke-static {v12}, Lcom/flyersoft/opds/OpdsEntries;->-$$Nest$fgetuserAgent(Lcom/flyersoft/opds/OpdsEntries;)Ljava/lang/String;

    move-result-object v12

    iput-object v12, v3, Lcom/flyersoft/opds/OpdsEntry;->user_agent:Ljava/lang/String;

    .line 213
    const-string v3, ""

    iput-object v3, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->summary:Ljava/lang/String;

    const/4 v3, 0x0

    .line 214
    iput-object v3, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->aTmpHref:Ljava/lang/String;

    .line 217
    :cond_10
    iget-object v3, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    if-eqz v3, :cond_3b

    .line 218
    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3a

    .line 219
    iget-object v3, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->aTmpHref:Ljava/lang/String;

    if-nez v3, :cond_11

    .line 220
    iput-object v14, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->aTmpHref:Ljava/lang/String;

    .line 221
    :cond_11
    invoke-interface {v2, v10}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_12

    .line 223
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    :cond_12
    if-eqz v3, :cond_31

    .line 225
    const-string v4, "application"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_13

    const-string v4, "text/"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_31

    .line 226
    :cond_13
    invoke-interface {v2, v11}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 231
    const-string v12, "message/rfc822"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_30

    const-string v12, ".mht"

    invoke-virtual {v4, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_30

    const-string v12, ".mhtml"

    invoke-virtual {v4, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_14

    goto/16 :goto_14

    .line 235
    :cond_14
    const-string v12, "text/x-markdown"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_2f

    const-string v12, ".md"

    invoke-virtual {v4, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_15

    goto/16 :goto_13

    .line 239
    :cond_15
    const-string v12, "application/vnd.openxmlformats-officedocument.wordprocessingml.document"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_2e

    const-string v12, ".docx"

    invoke-virtual {v4, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_16

    goto/16 :goto_12

    .line 243
    :cond_16
    const-string v12, "application/vnd.oasis.opendocument.text"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_2d

    const-string v12, ".odt"

    invoke-virtual {v4, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_17

    goto/16 :goto_11

    .line 247
    :cond_17
    const-string v12, "text/rtf"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_2c

    const-string v12, ".rtf"

    invoke-virtual {v4, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_18

    goto/16 :goto_10

    .line 251
    :cond_18
    const-string v12, "application/epub+zip"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_2b

    const-string v12, ".epub"

    invoke-virtual {v4, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_2b

    const-string v12, ".epub3"

    invoke-virtual {v4, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_19

    goto/16 :goto_f

    .line 255
    :cond_19
    invoke-virtual {v3, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v12

    const/4 v13, -0x1

    if-ne v12, v13, :cond_2a

    const-string v12, ".pdf"

    invoke-virtual {v4, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_1a

    goto/16 :goto_e

    .line 259
    :cond_1a
    const-string v8, "mobipocket"

    invoke-virtual {v3, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    const-string v12, "mobi"

    const/4 v13, -0x1

    if-ne v8, v13, :cond_29

    :try_start_4
    const-string v8, ".mobi"

    invoke-virtual {v4, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_1b

    goto/16 :goto_d

    .line 263
    :cond_1b
    invoke-static {v4}, Lcom/flyersoft/tools/T;->getFileExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/flyersoft/tools/A;->isMobiExt(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_1c

    .line 264
    iget-object v1, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v1, v1, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    new-instance v2, Lcom/flyersoft/opds/OpdsEntry$BookUrl;

    invoke-direct {v2, v12, v4}, Lcom/flyersoft/opds/OpdsEntry$BookUrl;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    .line 267
    :cond_1c
    invoke-virtual {v3, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    const/4 v13, -0x1

    if-ne v8, v13, :cond_28

    const-string v8, ".txt"

    invoke-virtual {v4, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_28

    const-string v8, "text/plain"

    .line 268
    invoke-virtual {v3, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1d

    goto/16 :goto_c

    .line 272
    :cond_1d
    invoke-virtual {v3, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v7

    const/4 v13, -0x1

    if-ne v7, v13, :cond_27

    const-string v7, ".fb2"

    invoke-virtual {v4, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_27

    const-string v7, "/fb2/"

    invoke-virtual {v4, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_1e

    goto/16 :goto_b

    .line 276
    :cond_1e
    invoke-virtual {v3, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v6

    const/4 v13, -0x1

    if-ne v6, v13, :cond_26

    const-string v6, ".cbz"

    invoke-virtual {v4, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_26

    const-string v6, "/cbz/"

    invoke-virtual {v4, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_1f

    goto/16 :goto_a

    :cond_1f
    move-object/from16 v6, v18

    .line 280
    invoke-virtual {v3, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    const/4 v13, -0x1

    if-ne v5, v13, :cond_25

    const-string v5, ".cbr"

    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_25

    const-string v5, "/cbr/"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_20

    goto :goto_9

    :cond_20
    move-object/from16 v5, v17

    .line 284
    invoke-virtual {v3, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v6

    const/4 v13, -0x1

    if-ne v6, v13, :cond_23

    const-string v6, ".djvu"

    invoke-virtual {v4, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_21

    goto :goto_8

    .line 291
    :cond_21
    const-string v5, "mobi8-ebook"

    invoke-virtual {v3, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    const-string v6, "azw3"

    if-nez v5, :cond_22

    .line 292
    :try_start_5
    invoke-virtual {v3, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    const/4 v13, -0x1

    if-ne v5, v13, :cond_22

    const-string v5, ".azw3"

    .line 293
    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_31

    .line 294
    :cond_22
    iget-object v1, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v1, v1, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    new-instance v2, Lcom/flyersoft/opds/OpdsEntry$BookUrl;

    invoke-direct {v2, v6, v4}, Lcom/flyersoft/opds/OpdsEntry$BookUrl;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    .line 285
    :cond_23
    :goto_8
    new-instance v1, Lcom/flyersoft/opds/OpdsEntry$BookUrl;

    invoke-direct {v1, v5, v4}, Lcom/flyersoft/opds/OpdsEntry$BookUrl;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 286
    const-string v2, "+zip"

    invoke-virtual {v3, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_24

    const/4 v12, 0x1

    .line 287
    iput-boolean v12, v1, Lcom/flyersoft/opds/OpdsEntry$BookUrl;->isZip:Z

    .line 288
    :cond_24
    iget-object v2, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v2, v2, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    .line 281
    :cond_25
    :goto_9
    iget-object v1, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v1, v1, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    new-instance v2, Lcom/flyersoft/opds/OpdsEntry$BookUrl;

    invoke-direct {v2, v6, v4}, Lcom/flyersoft/opds/OpdsEntry$BookUrl;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    .line 277
    :cond_26
    :goto_a
    iget-object v1, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v1, v1, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    new-instance v2, Lcom/flyersoft/opds/OpdsEntry$BookUrl;

    invoke-direct {v2, v5, v4}, Lcom/flyersoft/opds/OpdsEntry$BookUrl;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    .line 273
    :cond_27
    :goto_b
    iget-object v1, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v1, v1, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    new-instance v2, Lcom/flyersoft/opds/OpdsEntry$BookUrl;

    invoke-direct {v2, v6, v4}, Lcom/flyersoft/opds/OpdsEntry$BookUrl;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    .line 269
    :cond_28
    :goto_c
    iget-object v1, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v1, v1, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    new-instance v2, Lcom/flyersoft/opds/OpdsEntry$BookUrl;

    invoke-direct {v2, v7, v4}, Lcom/flyersoft/opds/OpdsEntry$BookUrl;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    .line 260
    :cond_29
    :goto_d
    iget-object v1, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v1, v1, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    new-instance v2, Lcom/flyersoft/opds/OpdsEntry$BookUrl;

    invoke-direct {v2, v12, v4}, Lcom/flyersoft/opds/OpdsEntry$BookUrl;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    .line 256
    :cond_2a
    :goto_e
    iget-object v1, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v1, v1, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    new-instance v2, Lcom/flyersoft/opds/OpdsEntry$BookUrl;

    invoke-direct {v2, v8, v4}, Lcom/flyersoft/opds/OpdsEntry$BookUrl;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    .line 252
    :cond_2b
    :goto_f
    iget-object v1, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v1, v1, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    new-instance v2, Lcom/flyersoft/opds/OpdsEntry$BookUrl;

    const-string v3, "epub"

    invoke-direct {v2, v3, v4}, Lcom/flyersoft/opds/OpdsEntry$BookUrl;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    .line 248
    :cond_2c
    :goto_10
    iget-object v1, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v1, v1, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    new-instance v2, Lcom/flyersoft/opds/OpdsEntry$BookUrl;

    const-string v3, "rtf"

    invoke-direct {v2, v3, v4}, Lcom/flyersoft/opds/OpdsEntry$BookUrl;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    .line 244
    :cond_2d
    :goto_11
    iget-object v1, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v1, v1, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    new-instance v2, Lcom/flyersoft/opds/OpdsEntry$BookUrl;

    const-string v3, "odt"

    invoke-direct {v2, v3, v4}, Lcom/flyersoft/opds/OpdsEntry$BookUrl;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    .line 240
    :cond_2e
    :goto_12
    iget-object v1, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v1, v1, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    new-instance v2, Lcom/flyersoft/opds/OpdsEntry$BookUrl;

    const-string v3, "docx"

    invoke-direct {v2, v3, v4}, Lcom/flyersoft/opds/OpdsEntry$BookUrl;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    .line 236
    :cond_2f
    :goto_13
    iget-object v1, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v1, v1, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    new-instance v2, Lcom/flyersoft/opds/OpdsEntry$BookUrl;

    const-string v3, "md"

    invoke-direct {v2, v3, v4}, Lcom/flyersoft/opds/OpdsEntry$BookUrl;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    .line 232
    :cond_30
    :goto_14
    iget-object v1, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v1, v1, Lcom/flyersoft/opds/OpdsEntry;->urls:Ljava/util/ArrayList;

    new-instance v2, Lcom/flyersoft/opds/OpdsEntry$BookUrl;

    const-string v3, "mhtml"

    invoke-direct {v2, v3, v4}, Lcom/flyersoft/opds/OpdsEntry$BookUrl;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    :cond_31
    if-eqz v20, :cond_37

    .line 300
    const-string v4, "http://opds-spec.org/cover"

    move-object/from16 v5, v20

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_32

    .line 301
    iget-object v4, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iput-object v14, v4, Lcom/flyersoft/opds/OpdsEntry;->cover:Ljava/lang/String;

    .line 303
    :cond_32
    const-string v4, "http://opds-spec.org/thumbnail"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_35

    const-string v4, "http://opds-spec.org/opds-cover-image-thumbnail"

    .line 304
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_35

    const-string v4, "http://opds-spec.org/image/thumbnail"

    .line 305
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_35

    const-string v4, "http://opds-spec.org/image"

    .line 306
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_35

    const-string v4, "x-stanza-cover-image-thumbnail"

    .line 307
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_33

    goto :goto_15

    .line 321
    :cond_33
    const-string v4, "related"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_38

    .line 322
    iget-object v4, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v4, v4, Lcom/flyersoft/opds/OpdsEntry;->relatedList:Ljava/util/ArrayList;

    if-nez v4, :cond_34

    .line 323
    iget-object v4, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    iput-object v6, v4, Lcom/flyersoft/opds/OpdsEntry;->relatedList:Ljava/util/ArrayList;

    .line 324
    :cond_34
    new-instance v4, Lcom/flyersoft/opds/OpdsEntry$RelatedItem;

    invoke-direct {v4}, Lcom/flyersoft/opds/OpdsEntry$RelatedItem;-><init>()V

    .line 325
    invoke-interface {v2, v11}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v4, Lcom/flyersoft/opds/OpdsEntry$RelatedItem;->href:Ljava/lang/String;

    move-object/from16 v6, v19

    .line 326
    invoke-interface {v2, v6}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v4, Lcom/flyersoft/opds/OpdsEntry$RelatedItem;->title:Ljava/lang/String;

    .line 327
    iput-object v3, v4, Lcom/flyersoft/opds/OpdsEntry$RelatedItem;->type:Ljava/lang/String;

    .line 328
    iget-object v6, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iget-object v6, v6, Lcom/flyersoft/opds/OpdsEntry;->relatedList:Ljava/util/ArrayList;

    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_16

    :cond_35
    :goto_15
    if-eqz v14, :cond_36

    .line 309
    const-string v1, "data:image"

    invoke-virtual {v14, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v13, -0x1

    if-ne v1, v13, :cond_36

    .line 310
    iget-object v1, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iput-object v14, v1, Lcom/flyersoft/opds/OpdsEntry;->thumbnail:Ljava/lang/String;

    return-void

    .line 313
    :cond_36
    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x16

    if-le v1, v2, :cond_3b

    .line 314
    iget-object v1, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    invoke-virtual {v14, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/flyersoft/opds/OpdsEntry;->thumbnail:Ljava/lang/String;

    .line 315
    iget-object v1, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    const/4 v12, 0x1

    iput-boolean v12, v1, Lcom/flyersoft/opds/OpdsEntry;->thumbIsBase64:Z

    return-void

    :cond_37
    move-object/from16 v5, v20

    :cond_38
    :goto_16
    if-eqz v5, :cond_39

    .line 332
    const-string v4, "subsection"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_39

    const-string v4, "http://opds-spec.org/sort/"

    invoke-virtual {v5, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3a

    .line 333
    :cond_39
    iget-object v4, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    iput-object v3, v4, Lcom/flyersoft/opds/OpdsEntry;->linkType:Ljava/lang/String;

    .line 334
    iget-object v3, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    invoke-interface {v2, v11}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/flyersoft/tools/T;->UrlEncode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/flyersoft/opds/OpdsEntry;->linkHref:Ljava/lang/String;

    .line 340
    :cond_3a
    invoke-virtual {v9, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3b

    .line 341
    iget-object v1, v0, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;->entry:Lcom/flyersoft/opds/OpdsEntry;

    invoke-interface {v2, v10}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/flyersoft/opds/OpdsEntry;->contentType:Ljava/lang/String;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    :catch_0
    :cond_3b
    return-void
.end method
