.class Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;
.super Ljava/lang/Object;
.source "CSSParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/CSSParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "SimpleSelector"
.end annotation


# instance fields
.field attribs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/flyersoft/components/androidsvg/utils/CSSParser$Attrib;",
            ">;"
        }
    .end annotation
.end field

.field combinator:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;

.field pseudos:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClass;",
            ">;"
        }
    .end annotation
.end field

.field tag:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;Ljava/lang/String;)V
    .locals 1

    .line 172
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 168
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;->attribs:Ljava/util/List;

    .line 169
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;->pseudos:Ljava/util/List;

    if-eqz p1, :cond_0

    goto :goto_0

    .line 173
    :cond_0
    sget-object p1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;->DESCENDANT:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;

    :goto_0
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;->combinator:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;

    .line 174
    iput-object p2, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;->tag:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method addAttrib(Ljava/lang/String;Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;Ljava/lang/String;)V
    .locals 2

    .line 179
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;->attribs:Ljava/util/List;

    if-nez v0, :cond_0

    .line 180
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;->attribs:Ljava/util/List;

    .line 181
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;->attribs:Ljava/util/List;

    new-instance v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Attrib;

    invoke-direct {v1, p1, p2, p3}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Attrib;-><init>(Ljava/lang/String;Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method addPseudo(Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClass;)V
    .locals 1

    .line 186
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;->pseudos:Ljava/util/List;

    if-nez v0, :cond_0

    .line 187
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;->pseudos:Ljava/util/List;

    .line 188
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;->pseudos:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 194
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 195
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;->combinator:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;

    sget-object v2, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;->CHILD:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;

    if-ne v1, v2, :cond_0

    .line 196
    const-string v1, "> "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 197
    :cond_0
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;->combinator:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;

    sget-object v2, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;->FOLLOWS:Lcom/flyersoft/components/androidsvg/utils/CSSParser$Combinator;

    if-ne v1, v2, :cond_1

    .line 198
    const-string v1, "+ "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 199
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;->tag:Ljava/lang/String;

    if-nez v1, :cond_2

    const-string v1, "*"

    :cond_2
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;->attribs:Ljava/util/List;

    if-eqz v1, :cond_6

    .line 201
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Attrib;

    const/16 v3, 0x5b

    .line 202
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object v3, v2, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Attrib;->name:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 203
    iget-object v3, v2, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Attrib;->operation:Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;

    invoke-virtual {v3}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;->ordinal()I

    move-result v3

    const/4 v4, 0x1

    if-eq v3, v4, :cond_5

    const/4 v4, 0x2

    if-eq v3, v4, :cond_4

    const/4 v4, 0x3

    if-eq v3, v4, :cond_3

    goto :goto_2

    .line 206
    :cond_3
    const-string v3, "|="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v2, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Attrib;->value:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 205
    :cond_4
    const-string v3, "~="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v2, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Attrib;->value:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    :cond_5
    const/16 v3, 0x3d

    .line 204
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object v2, v2, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Attrib;->value:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_2
    const/16 v2, 0x5d

    .line 209
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 212
    :cond_6
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$SimpleSelector;->pseudos:Ljava/util/List;

    if-eqz v1, :cond_7

    .line 213
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClass;

    const/16 v3, 0x3a

    .line 214
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_3

    .line 216
    :cond_7
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
