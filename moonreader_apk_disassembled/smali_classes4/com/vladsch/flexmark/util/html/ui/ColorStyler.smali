.class public Lcom/vladsch/flexmark/util/html/ui/ColorStyler;
.super Lcom/vladsch/flexmark/util/html/ui/HtmlStylerBase;
.source "ColorStyler.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vladsch/flexmark/util/html/ui/HtmlStylerBase<",
        "Ljava/awt/Color;",
        ">;"
    }
.end annotation


# static fields
.field public static final colorNameMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final nameColorMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 117
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->colorNameMap:Ljava/util/HashMap;

    .line 118
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->nameColorMap:Ljava/util/HashMap;

    const/4 v0, 0x0

    .line 126
    const-string v1, "black"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const/16 v0, 0x80

    .line 127
    const-string v1, "navy"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const/16 v0, 0x8b

    .line 128
    const-string v1, "darkblue"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const/16 v0, 0xcd

    .line 129
    const-string v1, "mediumblue"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const/16 v0, 0xff

    .line 130
    const-string v1, "blue"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const/16 v0, 0x6400

    .line 131
    const-string v1, "darkgreen"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0x8000

    .line 132
    const-string v1, "green"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0x8080

    .line 133
    const-string v1, "teal"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0x8b8b

    .line 134
    const-string v1, "darkcyan"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xbfff

    .line 135
    const-string v1, "deepskyblue"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xced1

    .line 136
    const-string v1, "darkturquoise"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xfa9a

    .line 137
    const-string v1, "mediumspringgreen"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xff00

    .line 138
    const-string v1, "lime"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xff7f

    .line 139
    const-string v1, "springgreen"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xffff

    .line 140
    const-string v1, "aqua"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0x191970

    .line 141
    const-string v1, "midnightblue"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0x1e90ff

    .line 142
    const-string v1, "dodgerblue"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0x20b2aa

    .line 143
    const-string v1, "lightseagreen"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0x228b22

    .line 144
    const-string v1, "forestgreen"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0x2e8b57

    .line 145
    const-string v1, "seagreen"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    .line 146
    const-string v0, "darkslategray"

    const v1, 0x2f4f4f

    invoke-static {v1, v0}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    .line 147
    const-string v0, "darkslategrey"

    invoke-static {v1, v0}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0x32cd32

    .line 148
    const-string v1, "limegreen"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0x3cb371

    .line 149
    const-string v1, "mediumseagreen"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0x40e0d0

    .line 150
    const-string v1, "turquoise"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0x4169e1

    .line 151
    const-string v1, "royalblue"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0x4682b4

    .line 152
    const-string v1, "steelblue"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0x483d8b

    .line 153
    const-string v1, "darkslateblue"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0x48d1cc

    .line 154
    const-string v1, "mediumturquoise"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0x4b0082

    .line 155
    const-string v1, "indigo"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0x556b2f

    .line 156
    const-string v1, "darkolivegreen"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0x5f9ea0

    .line 157
    const-string v1, "cadetblue"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0x6495ed

    .line 158
    const-string v1, "cornflowerblue"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0x663399

    .line 159
    const-string v1, "rebeccapurple"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0x66cdaa

    .line 160
    const-string v1, "mediumaquamarine"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    .line 161
    const-string v0, "dimgray"

    const v1, 0x696969

    invoke-static {v1, v0}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    .line 162
    const-string v0, "dimgrey"

    invoke-static {v1, v0}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0x6a5acd

    .line 163
    const-string v1, "slateblue"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0x6b8e23

    .line 164
    const-string v1, "olivedrab"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    .line 165
    const-string v0, "slategray"

    const v1, 0x708090

    invoke-static {v1, v0}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    .line 166
    const-string v0, "slategrey"

    invoke-static {v1, v0}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    .line 167
    const-string v0, "lightslategray"

    const v1, 0x778899

    invoke-static {v1, v0}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    .line 168
    const-string v0, "lightslategrey"

    invoke-static {v1, v0}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0x7b68ee

    .line 169
    const-string v1, "mediumslateblue"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0x7cfc00

    .line 170
    const-string v1, "lawngreen"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0x7fff00

    .line 171
    const-string v1, "chartreuse"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0x7fffd4

    .line 172
    const-string v1, "aquamarine"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const/high16 v0, 0x800000

    .line 173
    const-string v1, "maroon"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0x800080

    .line 174
    const-string v1, "purple"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0x808000

    .line 175
    const-string v1, "olive"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    .line 176
    const-string v0, "gray"

    const v1, 0x808080

    invoke-static {v1, v0}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    .line 177
    const-string v0, "grey"

    invoke-static {v1, v0}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0x87ceeb

    .line 178
    const-string v1, "skyblue"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0x87cefa

    .line 179
    const-string v1, "lightskyblue"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0x8a2be2

    .line 180
    const-string v1, "blueviolet"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const/high16 v0, 0x8b0000

    .line 181
    const-string v1, "darkred"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0x8b008b

    .line 182
    const-string v1, "darkmagenta"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0x8b4513

    .line 183
    const-string v1, "saddlebrown"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0x8fbc8f

    .line 184
    const-string v1, "darkseagreen"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0x90ee90

    .line 185
    const-string v1, "lightgreen"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0x9370db

    .line 186
    const-string v1, "mediumpurple"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0x9400d3

    .line 187
    const-string v1, "darkviolet"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0x98fb98

    .line 188
    const-string v1, "palegreen"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0x9932cc

    .line 189
    const-string v1, "darkorchid"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0x9acd32

    .line 190
    const-string v1, "yellowgreen"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xa0522d

    .line 191
    const-string v1, "sienna"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xa52a2a

    .line 192
    const-string v1, "brown"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    .line 193
    const-string v0, "darkgray"

    const v1, 0xa9a9a9

    invoke-static {v1, v0}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    .line 194
    const-string v0, "darkgrey"

    invoke-static {v1, v0}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xadd8e6

    .line 195
    const-string v1, "lightblue"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xadff2f

    .line 196
    const-string v1, "greenyellow"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xafeeee

    .line 197
    const-string v1, "paleturquoise"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xb0c4de

    .line 198
    const-string v1, "lightsteelblue"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xb0e0e6

    .line 199
    const-string v1, "powderblue"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xb22222

    .line 200
    const-string v1, "firebrick"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xb8860b

    .line 201
    const-string v1, "darkgoldenrod"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xba55d3

    .line 202
    const-string v1, "mediumorchid"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xbc8f8f

    .line 203
    const-string v1, "rosybrown"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xbdb76b

    .line 204
    const-string v1, "darkkhaki"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xc0c0c0

    .line 205
    const-string v1, "silver"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xc71585

    .line 206
    const-string v1, "mediumvioletred"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xcd5c5c

    .line 207
    const-string v1, "indianred"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xcd853f

    .line 208
    const-string v1, "peru"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xd2691e

    .line 209
    const-string v1, "chocolate"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xd2b48c

    .line 210
    const-string v1, "tan"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    .line 211
    const-string v0, "lightgray"

    const v1, 0xd3d3d3

    invoke-static {v1, v0}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    .line 212
    const-string v0, "lightgrey"

    invoke-static {v1, v0}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xd8bfd8

    .line 213
    const-string v1, "thistle"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xda70d6

    .line 214
    const-string v1, "orchid"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xdaa520

    .line 215
    const-string v1, "goldenrod"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xdb7093

    .line 216
    const-string v1, "palevioletred"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xdc143c

    .line 217
    const-string v1, "crimson"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xdcdcdc

    .line 218
    const-string v1, "gainsboro"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xdda0dd

    .line 219
    const-string v1, "plum"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xdeb887

    .line 220
    const-string v1, "burlywood"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xe0ffff

    .line 221
    const-string v1, "lightcyan"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xe6e6fa

    .line 222
    const-string v1, "lavender"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xe9967a

    .line 223
    const-string v1, "darksalmon"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xee82ee

    .line 224
    const-string v1, "violet"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xeee8aa

    .line 225
    const-string v1, "palegoldenrod"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xf08080

    .line 226
    const-string v1, "lightcoral"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xf0e68c

    .line 227
    const-string v1, "khaki"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xf0f8ff

    .line 228
    const-string v1, "aliceblue"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xf0fff0

    .line 229
    const-string v1, "honeydew"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xf0ffff

    .line 230
    const-string v1, "azure"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xf4a460

    .line 231
    const-string v1, "sandybrown"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xf5deb3

    .line 232
    const-string v1, "wheat"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xf5f5dc

    .line 233
    const-string v1, "beige"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xf5f5f5

    .line 234
    const-string v1, "whitesmoke"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xf5fffa

    .line 235
    const-string v1, "mintcream"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xf8f8ff

    .line 236
    const-string v1, "ghostwhite"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xfa8072

    .line 237
    const-string v1, "salmon"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xfaebd7

    .line 238
    const-string v1, "antiquewhite"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xfaf0e6

    .line 239
    const-string v1, "linen"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xfafad2

    .line 240
    const-string v1, "lightgoldenrodyellow"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xfdf5e6

    .line 241
    const-string v1, "oldlace"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const/high16 v0, 0xff0000

    .line 242
    const-string v1, "red"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xff00ff

    .line 243
    const-string v1, "fuchsia"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xff1493

    .line 244
    const-string v1, "deeppink"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xff4500

    .line 245
    const-string v1, "orangered"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xff6347

    .line 246
    const-string v1, "tomato"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xff69b4

    .line 247
    const-string v1, "hotpink"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xff7f50

    .line 248
    const-string v1, "coral"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xff8c00

    .line 249
    const-string v1, "darkorange"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xffa07a

    .line 250
    const-string v1, "lightsalmon"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xffa500

    .line 251
    const-string v1, "orange"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xffb6c1

    .line 252
    const-string v1, "lightpink"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xffc0cb

    .line 253
    const-string v1, "pink"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xffd700

    .line 254
    const-string v1, "gold"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xffdab9

    .line 255
    const-string v1, "peachpuff"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xffdead

    .line 256
    const-string v1, "navajowhite"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xffe4b5    # 2.3500096E-38f

    .line 257
    const-string v1, "moccasin"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xffe4c4

    .line 258
    const-string v1, "bisque"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xffe4e1

    .line 259
    const-string v1, "mistyrose"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xffebcd

    .line 260
    const-string v1, "blanchedalmond"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xffefd5

    .line 261
    const-string v1, "papayawhip"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xfff0f5

    .line 262
    const-string v1, "lavenderblush"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xfff5ee

    .line 263
    const-string v1, "seashell"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xfff8dc

    .line 264
    const-string v1, "cornsilk"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xfffacd

    .line 265
    const-string v1, "lemonchiffon"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xfffaf0

    .line 266
    const-string v1, "floralwhite"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xfffafa

    .line 267
    const-string v1, "snow"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xffff00

    .line 268
    const-string v1, "yellow"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xffffe0

    .line 269
    const-string v1, "lightyellow"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xfffff0

    .line 270
    const-string v1, "ivory"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    const v0, 0xffffff

    .line 271
    const-string v1, "white"

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->addColorName(ILjava/lang/String;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/html/ui/HtmlStylerBase;-><init>()V

    return-void
.end method

.method private static addColorName(ILjava/lang/String;)V
    .locals 2

    .line 121
    sget-object v0, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->colorNameMap:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    sget-object v0, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->nameColorMap:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v0, p1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public static getColorName(Ljava/awt/Color;)Ljava/lang/String;
    .locals 2

    if-eqz p0, :cond_0

    .line 98
    sget-object v0, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->colorNameMap:Ljava/util/HashMap;

    invoke-virtual {p0}, Ljava/awt/Color;->getRGB()I

    move-result p0

    const v1, 0xffffff

    and-int/2addr p0, v1

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static getColorNameOrRGB(Ljava/awt/Color;)Ljava/lang/String;
    .locals 5

    if-eqz p0, :cond_1

    .line 110
    invoke-virtual {p0}, Ljava/awt/Color;->getRGB()I

    move-result v0

    .line 111
    sget-object v1, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->colorNameMap:Ljava/util/HashMap;

    const v2, 0xffffff

    and-int/2addr v0, v2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_0

    return-object v0

    .line 112
    :cond_0
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p0}, Ljava/awt/Color;->getRed()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0}, Ljava/awt/Color;->getGreen()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0}, Ljava/awt/Color;->getBlue()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v1, v3, v4

    const/4 v1, 0x1

    aput-object v2, v3, v1

    const/4 v1, 0x2

    aput-object p0, v3, v1

    const-string p0, "rgb(%d,%d,%d)"

    invoke-static {v0, p0, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 114
    :cond_1
    const-string p0, ""

    return-object p0
.end method

.method public static getColorValue(Ljava/awt/Color;)Ljava/lang/String;
    .locals 9

    if-nez p0, :cond_0

    .line 102
    const-string p0, ""

    return-object p0

    :cond_0
    invoke-virtual {p0}, Ljava/awt/Color;->getAlpha()I

    move-result v0

    const/16 v1, 0xff

    const/4 v2, 0x2

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x3

    if-eq v0, v1, :cond_1

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p0}, Ljava/awt/Color;->getRed()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0}, Ljava/awt/Color;->getGreen()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {p0}, Ljava/awt/Color;->getBlue()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {p0}, Ljava/awt/Color;->getAlpha()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    const/4 v8, 0x4

    new-array v8, v8, [Ljava/lang/Object;

    aput-object v1, v8, v4

    aput-object v6, v8, v3

    aput-object v7, v8, v2

    aput-object p0, v8, v5

    const-string p0, "rgba(%d,%d,%d,%d)"

    invoke-static {v0, p0, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 103
    invoke-virtual {p0}, Ljava/awt/Color;->getRed()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0}, Ljava/awt/Color;->getGreen()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {p0}, Ljava/awt/Color;->getBlue()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v1, v5, v4

    aput-object v6, v5, v3

    aput-object p0, v5, v2

    const-string p0, "%02x%02x%02x"

    invoke-static {v0, p0, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getNamedColor(Ljava/lang/String;)Ljava/awt/Color;
    .locals 9

    .line 36
    const-string v0, "#"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    .line 38
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x10

    invoke-static {v2, v3}, Lcom/vladsch/flexmark/util/Utils;->parseIntOrNull(Ljava/lang/String;I)Ljava/lang/Integer;

    move-result-object v2

    if-nez v2, :cond_0

    return-object v1

    .line 40
    :cond_0
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 46
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x3

    const/4 v5, 0x2

    const-string v6, ""

    if-eq v2, v4, :cond_4

    const/4 v7, 0x4

    if-eq v2, v7, :cond_3

    const/4 v4, 0x6

    if-eq v2, v4, :cond_2

    const/16 v8, 0x8

    if-eq v2, v8, :cond_1

    return-object v1

    .line 67
    :cond_1
    invoke-virtual {p0, v3, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 68
    invoke-virtual {p0, v5, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 69
    invoke-virtual {p0, v7, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 70
    invoke-virtual {p0, v4, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 61
    :cond_2
    invoke-virtual {p0, v3, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 62
    invoke-virtual {p0, v5, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 63
    invoke-virtual {p0, v7, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 54
    :cond_3
    invoke-virtual {p0, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 55
    invoke-virtual {p0, v0, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 56
    invoke-virtual {p0, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 57
    invoke-virtual {p0, v4, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    move-object p0, v3

    goto :goto_0

    .line 48
    :cond_4
    invoke-virtual {p0, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 49
    invoke-virtual {p0, v0, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 50
    invoke-virtual {p0, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 77
    :goto_0
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-ne v3, v0, :cond_5

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 78
    :cond_5
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-ne v3, v0, :cond_6

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 79
    :cond_6
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ne v3, v0, :cond_7

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 80
    :cond_7
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v3

    if-ne v3, v0, :cond_8

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 82
    :cond_8
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 83
    const-string v6, "ff"

    .line 86
    :cond_9
    new-instance v0, Ljava/awt/Color;

    invoke-static {v1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->parse(Ljava/lang/String;)I

    move-result v1

    invoke-static {v2}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->parse(Ljava/lang/String;)I

    move-result v2

    invoke-static {p0}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->parse(Ljava/lang/String;)I

    move-result p0

    invoke-static {v6}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->parse(Ljava/lang/String;)I

    move-result v3

    invoke-direct {v0, v1, v2, p0, v3}, Ljava/awt/Color;-><init>(IIII)V

    return-object v0

    .line 89
    :cond_a
    sget-object v0, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->nameColorMap:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    if-nez p0, :cond_b

    return-object v1

    .line 90
    :cond_b
    new-instance v0, Ljava/awt/Color;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    invoke-direct {v0, p0}, Ljava/awt/Color;-><init>(I)V

    return-object v0
.end method

.method static parse(Ljava/lang/String;)I
    .locals 1

    const/16 v0, 0x10

    .line 94
    invoke-static {p0, v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result p0

    return p0
.end method


# virtual methods
.method public getStyle(Ljava/awt/Color;)Ljava/lang/String;
    .locals 3

    .line 30
    instance-of v0, p1, Lcom/vladsch/flexmark/util/html/ui/BackgroundColor;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    invoke-static {p1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->getColorValue(Ljava/awt/Color;)Ljava/lang/String;

    move-result-object p1

    new-array v0, v2, [Ljava/lang/Object;

    aput-object p1, v0, v1

    const-string p1, "background-color:#%s"

    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    if-nez p1, :cond_1

    .line 31
    const-string p1, ""

    return-object p1

    :cond_1
    invoke-static {p1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->getColorValue(Ljava/awt/Color;)Ljava/lang/String;

    move-result-object p1

    new-array v0, v2, [Ljava/lang/Object;

    aput-object p1, v0, v1

    const-string p1, "color:#%s"

    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic getStyle(Ljava/lang/Object;)Ljava/lang/String;
    .locals 0

    .line 26
    check-cast p1, Ljava/awt/Color;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/html/ui/ColorStyler;->getStyle(Ljava/awt/Color;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
