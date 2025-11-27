.class interface abstract Lcom/flyersoft/components/androidsvg/utils/SVGParser;
.super Ljava/lang/Object;
.source "SVGParser.java"


# virtual methods
.method public abstract parseStream(Ljava/io/InputStream;)Lcom/flyersoft/components/androidsvg/utils/SVGBase;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation
.end method

.method public abstract setExternalFileResolver(Lcom/flyersoft/components/androidsvg/SVGExternalFileResolver;)Lcom/flyersoft/components/androidsvg/utils/SVGParser;
.end method

.method public abstract setInternalEntitiesEnabled(Z)Lcom/flyersoft/components/androidsvg/utils/SVGParser;
.end method
