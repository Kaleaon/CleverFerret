.class Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SAXHandler;
.super Lorg/xml/sax/ext/DefaultHandler2;
.source "SVGParserImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SAXHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;


# direct methods
.method private constructor <init>(Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010
        }
        names = {
            null
        }
    .end annotation

    .line 856
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SAXHandler;->this$0:Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;

    invoke-direct {p0}, Lorg/xml/sax/ext/DefaultHandler2;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SAXHandler;-><init>(Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;)V

    return-void
.end method


# virtual methods
.method public characters([CII)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 875
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SAXHandler;->this$0:Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;

    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-static {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->-$$Nest$mtext(Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;Ljava/lang/String;)V

    return-void
.end method

.method public endDocument()V
    .locals 1

    .line 898
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SAXHandler;->this$0:Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;

    invoke-static {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->-$$Nest$mendDocument(Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;)V

    return-void
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 891
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SAXHandler;->this$0:Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;

    invoke-static {v0, p1, p2, p3}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->-$$Nest$mendElement(Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public processingInstruction(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 905
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;

    invoke-direct {v0, p2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;-><init>(Ljava/lang/String;)V

    .line 906
    iget-object p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SAXHandler;->this$0:Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;

    invoke-static {p2, v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->-$$Nest$mparseProcessingInstructionAttributes(Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;Lcom/flyersoft/components/androidsvg/utils/TextScanner;)Ljava/util/Map;

    move-result-object p2

    .line 907
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SAXHandler;->this$0:Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;

    invoke-static {v0, p1, p2}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->-$$Nest$mhandleProcessingInstruction(Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public startDocument()V
    .locals 1

    .line 861
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SAXHandler;->this$0:Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;

    invoke-static {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->-$$Nest$mstartDocument(Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;)V

    return-void
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 868
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl$SAXHandler;->this$0:Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;

    invoke-static {v0, p1, p2, p3, p4}, Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;->-$$Nest$mstartElement(Lcom/flyersoft/components/androidsvg/utils/SVGParserImpl;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    return-void
.end method
