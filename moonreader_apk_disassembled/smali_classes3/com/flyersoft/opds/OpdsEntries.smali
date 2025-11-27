.class public Lcom/flyersoft/opds/OpdsEntries;
.super Ljava/lang/Object;
.source "OpdsEntries.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/opds/OpdsEntries$XmlHandler;
    }
.end annotation


# instance fields
.field private baseUrl:Ljava/lang/String;

.field public entries:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/opds/OpdsEntry;",
            ">;"
        }
    .end annotation
.end field

.field public errorMsg:Ljava/lang/String;

.field public itemsPerPage:I

.field public lastScrollItem:I

.field public library:Lcom/flyersoft/opds/OpdsSite;

.field public nextUrl:Ljava/lang/String;

.field public totalResults:I

.field private userAgent:Ljava/lang/String;

.field public xml_subtitle:Ljava/lang/String;

.field public xml_title:Ljava/lang/String;


# direct methods
.method static bridge synthetic -$$Nest$fgetbaseUrl(Lcom/flyersoft/opds/OpdsEntries;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/opds/OpdsEntries;->baseUrl:Ljava/lang/String;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetuserAgent(Lcom/flyersoft/opds/OpdsEntries;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/opds/OpdsEntries;->userAgent:Ljava/lang/String;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputbaseUrl(Lcom/flyersoft/opds/OpdsEntries;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/flyersoft/opds/OpdsEntries;->baseUrl:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/flyersoft/opds/OpdsSite;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 28
    iput v0, p0, Lcom/flyersoft/opds/OpdsEntries;->totalResults:I

    .line 29
    iput v0, p0, Lcom/flyersoft/opds/OpdsEntries;->itemsPerPage:I

    .line 40
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/flyersoft/opds/OpdsEntries;->entries:Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 41
    iput-object v1, p0, Lcom/flyersoft/opds/OpdsEntries;->nextUrl:Ljava/lang/String;

    if-nez p2, :cond_0

    .line 44
    new-instance p2, Lcom/flyersoft/opds/OpdsSite;

    const/4 v2, 0x1

    invoke-direct {p2, v2}, Lcom/flyersoft/opds/OpdsSite;-><init>(Z)V

    :cond_0
    if-eqz p3, :cond_1

    .line 46
    iput-object p3, p0, Lcom/flyersoft/opds/OpdsEntries;->baseUrl:Ljava/lang/String;

    goto :goto_0

    .line 48
    :cond_1
    iget-object p3, p2, Lcom/flyersoft/opds/OpdsSite;->baseUrl:Ljava/lang/String;

    iput-object p3, p0, Lcom/flyersoft/opds/OpdsEntries;->baseUrl:Ljava/lang/String;

    :goto_0
    if-eqz p4, :cond_2

    .line 50
    iput-object p4, p0, Lcom/flyersoft/opds/OpdsEntries;->userAgent:Ljava/lang/String;

    goto :goto_1

    .line 52
    :cond_2
    iget-object p3, p2, Lcom/flyersoft/opds/OpdsSite;->useragent:Ljava/lang/String;

    iput-object p3, p0, Lcom/flyersoft/opds/OpdsEntries;->userAgent:Ljava/lang/String;

    .line 54
    :goto_1
    iput-object p2, p0, Lcom/flyersoft/opds/OpdsEntries;->library:Lcom/flyersoft/opds/OpdsSite;

    if-nez p1, :cond_3

    goto :goto_3

    .line 58
    :cond_3
    iput-object v1, p0, Lcom/flyersoft/opds/OpdsEntries;->errorMsg:Ljava/lang/String;

    .line 60
    :try_start_0
    invoke-direct {p0, p1}, Lcom/flyersoft/opds/OpdsEntries;->resetInputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p2

    if-nez p2, :cond_4

    .line 62
    iget-object p2, p0, Lcom/flyersoft/opds/OpdsEntries;->errorMsg:Ljava/lang/String;

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/opds/OpdsEntries;->getErrorMsg(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/flyersoft/opds/OpdsEntries;->errorMsg:Ljava/lang/String;

    return-void

    .line 65
    :cond_4
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object p3

    invoke-virtual {p3}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object p3

    invoke-virtual {p3}, Ljavax/xml/parsers/SAXParser;->getXMLReader()Lorg/xml/sax/XMLReader;

    move-result-object p3

    .line 66
    new-instance p4, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;

    invoke-direct {p4, p0}, Lcom/flyersoft/opds/OpdsEntries$XmlHandler;-><init>(Lcom/flyersoft/opds/OpdsEntries;)V

    invoke-interface {p3, p4}, Lorg/xml/sax/XMLReader;->setContentHandler(Lorg/xml/sax/ContentHandler;)V

    .line 67
    new-instance p4, Lorg/xml/sax/InputSource;

    invoke-direct {p4, p2}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    invoke-interface {p3, p4}, Lorg/xml/sax/XMLReader;->parse(Lorg/xml/sax/InputSource;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception p2

    .line 69
    invoke-static {p2, v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;Z)V

    .line 70
    invoke-static {p2}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/flyersoft/opds/OpdsEntries;->errorMsg:Ljava/lang/String;

    .line 72
    :goto_2
    iget-object p2, p0, Lcom/flyersoft/opds/OpdsEntries;->entries:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-nez p2, :cond_5

    .line 74
    :try_start_1
    iget-object p2, p0, Lcom/flyersoft/opds/OpdsEntries;->errorMsg:Ljava/lang/String;

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/opds/OpdsEntries;->getErrorMsg(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/opds/OpdsEntries;->errorMsg:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    :cond_5
    :goto_3
    return-void
.end method

.method private getErrorMsg(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 89
    const-string v0, "</html>"

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-lez v0, :cond_1

    .line 90
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p2

    const-string v0, "calibre"

    invoke-virtual {p2, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p2

    const/4 v0, -0x1

    if-eq p2, v0, :cond_0

    .line 91
    const-string p2, "<h3>Invalidated OPDS content</h3><h5>Note: if you use calibre server, please append \"/opds\" to the Url (example: <font color=#FF0000>https://192.168.1.100:8080/opds)</font></h5>"

    goto :goto_0

    .line 92
    :cond_0
    const-string p2, "<h3>No validated OPDS content, click <a href=\"https://opds-spec.org\"/>here</a> to see what\'s OPDS Catalog.</h3>"

    .line 93
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "<h3>"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "</h3>"

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 94
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getHtmlBody(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_1
    if-nez p2, :cond_2

    const/4 p1, 0x0

    return-object p1

    .line 99
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "<h3>Invalidated OPDS content, please contact owner of this OPDS site to verify below error:</h3><h4><font color=#FF0000>"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "</font></h4>"

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 100
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "<pre>"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Landroid/text/TextUtils;->htmlEncode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "</pre>"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 102
    :goto_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "<hr><br>"

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private resetInputStream(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 1

    .line 106
    const-string v0, "<?xml "

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-lez v0, :cond_0

    .line 108
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 110
    :cond_0
    invoke-static {p1}, Lcom/flyersoft/tools/T;->String2InputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public specailCheckOk(Lcom/flyersoft/opds/OpdsEntry;)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method
