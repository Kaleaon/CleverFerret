.class public Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;
.super Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
.source "HtmlBuilder.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase<",
        "Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;",
        ">;"
    }
.end annotation


# static fields
.field public static final stylerMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Class;",
            "Lcom/vladsch/flexmark/util/html/ui/HtmlStyler;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final myBuilder:Ljava/lang/Appendable;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 134
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->stylerMap:Ljava/util/HashMap;

    .line 136
    new-instance v1, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;

    invoke-direct {v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;-><init>()V

    .line 137
    const-class v2, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    const-class v2, Lcom/vladsch/flexmark/util/html/ui/Color;

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    const-class v2, Ljava/awt/Color;

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    new-instance v1, Lcom/vladsch/flexmark/util/html/ui/FontStyler;

    invoke-direct {v1}, Lcom/vladsch/flexmark/util/html/ui/FontStyler;-><init>()V

    .line 143
    const-class v2, Ljava/awt/Font;

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 144
    const-class v2, Ljavax/swing/plaf/FontUIResource;

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    const-class v1, Lcom/vladsch/flexmark/util/html/ui/FontStyle;

    new-instance v2, Lcom/vladsch/flexmark/util/html/ui/FontStyleStyler;

    invoke-direct {v2}, Lcom/vladsch/flexmark/util/html/ui/FontStyleStyler;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 32
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    const/16 v2, 0x10

    invoke-direct {p0, v0, v1, v2}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;-><init>(Ljava/lang/Appendable;II)V

    .line 33
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->getAppendable()Ljava/lang/Appendable;

    move-result-object v0

    iput-object v0, p0, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->myBuilder:Ljava/lang/Appendable;

    return-void
.end method

.method public constructor <init>(II)V
    .locals 1

    .line 37
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, v0, p1, p2}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;-><init>(Ljava/lang/Appendable;II)V

    .line 38
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->getAppendable()Ljava/lang/Appendable;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->myBuilder:Ljava/lang/Appendable;

    return-void
.end method

.method public static addColorStylerClass(Ljava/lang/Class;)V
    .locals 2

    .line 149
    sget-object v0, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->stylerMap:Ljava/util/HashMap;

    const-class v1, Lcom/vladsch/flexmark/util/html/ui/Color;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/html/ui/HtmlStyler;

    .line 150
    invoke-virtual {v0, p0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public static getAttribute(Ljava/lang/Object;)Lcom/vladsch/flexmark/util/html/Attribute;
    .locals 1

    .line 173
    invoke-static {p0}, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->getHtmlStyler(Ljava/lang/Object;)Lcom/vladsch/flexmark/util/html/ui/HtmlStyler;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 176
    invoke-interface {v0, p0}, Lcom/vladsch/flexmark/util/html/ui/HtmlStyler;->getStyleable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-interface {v0, p0}, Lcom/vladsch/flexmark/util/html/ui/HtmlStyler;->getStyle(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 177
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 178
    const-string v0, "style"

    invoke-static {v0, p0}, Lcom/vladsch/flexmark/util/html/AttributeImpl;->of(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/AttributeImpl;

    move-result-object p0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static getHtmlStyler(Ljava/lang/Object;)Lcom/vladsch/flexmark/util/html/ui/HtmlStyler;
    .locals 4

    .line 154
    sget-object v0, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->stylerMap:Ljava/util/HashMap;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/html/ui/HtmlStyler;

    if-eqz v1, :cond_0

    return-object v1

    .line 158
    :cond_0
    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Class;

    .line 160
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 161
    sget-object v0, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->stylerMap:Ljava/util/HashMap;

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lcom/vladsch/flexmark/util/html/ui/HtmlStyler;

    :cond_2
    if-eqz v1, :cond_3

    .line 167
    sget-object v0, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->stylerMap:Ljava/util/HashMap;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {v0, p0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3
    return-object v1
.end method


# virtual methods
.method public bridge synthetic append(C)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 27
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->append(C)Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 27
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic append(Ljava/lang/CharSequence;II)Lcom/vladsch/flexmark/util/html/FormattingAppendable;
    .locals 0

    .line 27
    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->append(Ljava/lang/CharSequence;II)Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic append(C)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 0

    .line 27
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->append(C)Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 0

    .line 27
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic append(Ljava/lang/CharSequence;II)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 0

    .line 27
    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->append(Ljava/lang/CharSequence;II)Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    move-result-object p1

    return-object p1
.end method

.method public append(C)Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;
    .locals 0

    .line 201
    invoke-super {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->append(C)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    return-object p1
.end method

.method public append(D)Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;
    .locals 0

    .line 209
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object p1

    invoke-super {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    return-object p1
.end method

.method public append(F)Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;
    .locals 0

    .line 207
    invoke-static {p1}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object p1

    invoke-super {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    return-object p1
.end method

.method public append(I)Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;
    .locals 0

    .line 203
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-super {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    return-object p1
.end method

.method public append(J)Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;
    .locals 0

    .line 205
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    invoke-super {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    return-object p1
.end method

.method public append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;
    .locals 0

    .line 191
    invoke-super {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    return-object p1
.end method

.method public append(Ljava/lang/CharSequence;II)Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;
    .locals 0

    .line 193
    invoke-super {p0, p1, p2, p3}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->append(Ljava/lang/CharSequence;II)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    return-object p1
.end method

.method public append(Ljava/lang/Object;)Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;
    .locals 0

    .line 185
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-super {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    return-object p1
.end method

.method public append(Ljava/lang/String;)Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;
    .locals 0

    .line 187
    invoke-super {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    return-object p1
.end method

.method public append(Ljava/lang/StringBuffer;)Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;
    .locals 0

    .line 189
    invoke-virtual {p1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-super {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    return-object p1
.end method

.method public append(Z)Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;
    .locals 0

    if-eqz p1, :cond_0

    .line 199
    const-string p1, "true"

    goto :goto_0

    :cond_0
    const-string p1, "false"

    :goto_0
    invoke-super {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    return-object p1
.end method

.method public append([C)Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;
    .locals 2

    const/4 v0, 0x0

    .line 195
    array-length v1, p1

    invoke-static {p1, v0, v1}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->of([CII)Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    move-result-object p1

    invoke-super {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    return-object p1
.end method

.method public append([CII)Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;
    .locals 0

    add-int/2addr p3, p2

    .line 197
    invoke-static {p1, p2, p3}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->of([CII)Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    move-result-object p1

    invoke-super {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    return-object p1
.end method

.method public bridge synthetic append(C)Ljava/lang/Appendable;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 27
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->append(C)Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 27
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic append(Ljava/lang/CharSequence;II)Ljava/lang/Appendable;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 27
    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->append(Ljava/lang/CharSequence;II)Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic attr(Lcom/vladsch/flexmark/util/html/Attributes;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
    .locals 0

    .line 27
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->attr(Lcom/vladsch/flexmark/util/html/Attributes;)Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
    .locals 0

    .line 27
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic attr([Lcom/vladsch/flexmark/util/html/Attribute;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
    .locals 0

    .line 27
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->attr([Lcom/vladsch/flexmark/util/html/Attribute;)Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic attr(Lcom/vladsch/flexmark/util/html/Attributes;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 0

    .line 27
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->attr(Lcom/vladsch/flexmark/util/html/Attributes;)Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 0

    .line 27
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic attr([Lcom/vladsch/flexmark/util/html/Attribute;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 0

    .line 27
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->attr([Lcom/vladsch/flexmark/util/html/Attribute;)Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    move-result-object p1

    return-object p1
.end method

.method public attr(Lcom/vladsch/flexmark/util/html/Attributes;)Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;
    .locals 0

    .line 103
    invoke-super {p0}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->withAttr()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 104
    invoke-super {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->attr(Lcom/vladsch/flexmark/util/html/Attributes;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    return-object p1
.end method

.method public attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;
    .locals 0

    .line 86
    invoke-super {p0}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->withAttr()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 87
    invoke-super {p0, p1, p2}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    return-object p1
.end method

.method public varargs attr([Lcom/vladsch/flexmark/util/html/Attribute;)Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;
    .locals 0

    .line 97
    invoke-super {p0}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->withAttr()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 98
    invoke-super {p0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->attr([Lcom/vladsch/flexmark/util/html/Attribute;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    return-object p1
.end method

.method public varargs attr([Ljava/lang/Object;)Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;
    .locals 6

    .line 64
    array-length v0, p1

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_3

    aget-object v3, p1, v2

    .line 65
    instance-of v4, v3, Lcom/vladsch/flexmark/util/html/Attribute;

    const/4 v5, 0x1

    if-eqz v4, :cond_0

    .line 66
    new-array v4, v5, [Lcom/vladsch/flexmark/util/html/Attribute;

    check-cast v3, Lcom/vladsch/flexmark/util/html/Attribute;

    aput-object v3, v4, v1

    invoke-super {p0, v4}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->attr([Lcom/vladsch/flexmark/util/html/Attribute;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 67
    invoke-super {p0}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->withAttr()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    goto :goto_1

    .line 69
    :cond_0
    invoke-static {v3}, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->getHtmlStyler(Ljava/lang/Object;)Lcom/vladsch/flexmark/util/html/ui/HtmlStyler;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 73
    invoke-interface {v4, v3}, Lcom/vladsch/flexmark/util/html/ui/HtmlStyler;->getStyleable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v4, v3}, Lcom/vladsch/flexmark/util/html/ui/HtmlStyler;->getStyle(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 74
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_1

    .line 75
    const-string v4, "style"

    invoke-static {v4, v3}, Lcom/vladsch/flexmark/util/html/AttributeImpl;->of(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/AttributeImpl;

    move-result-object v3

    .line 76
    new-array v4, v5, [Lcom/vladsch/flexmark/util/html/Attribute;

    aput-object v3, v4, v1

    invoke-super {p0, v4}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->attr([Lcom/vladsch/flexmark/util/html/Attribute;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 77
    invoke-super {p0}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->withAttr()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    :cond_1
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 70
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Don\'t know how to style "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3
    return-object p0
.end method

.method public closeAllTags()Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;
    .locals 1

    .line 43
    :goto_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->getOpenTags()Ljava/util/Stack;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Stack;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 44
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->getOpenTags()Ljava/util/Stack;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    .line 45
    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->closeTag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public closeSpan()Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;
    .locals 1

    .line 130
    const-string v0, "span"

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->closeTag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    return-object v0
.end method

.method public span()Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;
    .locals 2

    .line 108
    const-string v0, "span"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->tag(Ljava/lang/CharSequence;Z)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    return-object v0
.end method

.method public span(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;
    .locals 2

    .line 112
    const-string v0, "span"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->tag(Ljava/lang/CharSequence;Z)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 113
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->text(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 114
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->closeSpan()Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    move-result-object p1

    return-object p1
.end method

.method public span(Ljava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;
    .locals 1

    const/4 v0, 0x0

    .line 122
    invoke-virtual {p0, v0, p1}, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->span(ZLjava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    move-result-object p1

    return-object p1
.end method

.method public span(ZLjava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;
    .locals 2

    .line 118
    const-string v0, "span"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1, p1, p2}, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->tag(Ljava/lang/CharSequence;ZZLjava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    return-object p1
.end method

.method public spanLine(Ljava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;
    .locals 1

    const/4 v0, 0x1

    .line 126
    invoke-virtual {p0, v0, p1}, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->span(ZLjava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    move-result-object p1

    return-object p1
.end method

.method public style(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;
    .locals 1

    .line 91
    invoke-super {p0}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->withAttr()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 92
    const-string v0, "style"

    invoke-super {p0, v0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    return-object p1
.end method

.method public toFinalizedString()Ljava/lang/String;
    .locals 1

    .line 52
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->closeAllTags()Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;

    .line 53
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->flush()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 54
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->myBuilder:Ljava/lang/Appendable;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 59
    iget-object v0, p0, Lcom/vladsch/flexmark/util/html/ui/HtmlBuilder;->myBuilder:Ljava/lang/Appendable;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
