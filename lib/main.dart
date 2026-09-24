import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const AdvogadoSimplicioApp());
}

class AdvogadoSimplicioApp extends StatelessWidget {
  const AdvogadoSimplicioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Advogado Simplício',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF6F8FB),
        fontFamily: 'Arial',
        ),
         home: const HomePage(),
    );
  }
}

const site = 'https://rcts-assessoria-tributaria.com.br/';
const politicaPrivacidade =
    'https://rcts-assessoria-tributaria.com.br/politica-de-privacidade/';
const telefone = '5511995499883';
const email = 'advogado.simplicio@gmail.com';
const estatutoOab = 'https://www.planalto.gov.br/ccivil_03/leis/l8906.htm';
const codigoEtica =
    'https://www.oab.org.br/leisnormas/legislacao/resolucoes/02-2015';
const provimento205 =
    'https://www.oab.org.br/leisnormas/legislacao/provimentos/205-2021';

Future<void> abrirUrl(String endereco) async {
  await launchUrl(Uri.parse(endereco), mode: LaunchMode.externalApplication);
}

Future<void> abrirWhatsApp(String area) async {
  final mensagem = 'Olá! Gostaria de informações sobre: $area.';
  final uri = Uri.parse(
    'https://wa.me/$telefone?text=${Uri.encodeComponent(mensagem)}',
  );
  await launchUrl(uri, mode: LaunchMode.externalApplication);
}

Future<void> abrirEmail() async {
  await launchUrl(Uri(scheme: 'mailto', path: email));
}

class AreaJuridica {
  final String emoji;
  final String titulo;
  final String descricao;
  final List<MapEntry<String, String>> itens;

  const AreaJuridica({
    required this.emoji,
    required this.titulo,
    required this.descricao,
    required this.itens,
  });
}

final areas = <AreaJuridica>[
  AreaJuridica(
    emoji: '⚖',
    titulo: 'Direito Tributário',
    descricao:
        'Débitos fiscais, execução fiscal, parcelamentos, transação tributária e regularização fiscal.',
    itens: const [
      MapEntry('Regularização Fiscal',
          'Análise de débitos tributários e alternativas legais para regularização da situação fiscal.'),
      MapEntry('Transação Tributária',
          'Informações sobre modalidades de negociação de débitos, condições de adesão, capacidade de pagamento e requisitos aplicáveis a cada situação.'),
      MapEntry('Execução Fiscal',
          'Orientação jurídica em cobranças judiciais de créditos tributários, análise da execução, garantias, defesas e situação processual.'),
      MapEntry('Parcelamentos',
          'Análise das modalidades de parcelamento disponíveis, requisitos, consolidação dos débitos e efeitos jurídicos da adesão.'),
      MapEntry('Certidão de Regularidade Fiscal',
          'Orientações sobre pendências, regularidade fiscal e obtenção de certidões tributárias.'),
    ],
  ),
  AreaJuridica(
    emoji: '👨‍👩‍👧',
    titulo: 'Direito de Família',
    descricao:
        'Divórcio, guarda, alimentos, inventário, união estável e sucessões.',
    itens: const [
      MapEntry('Divórcio e Dissolução',
          'Orientação sobre divórcio consensual ou litigioso, dissolução da união estável, efeitos patrimoniais e providências necessárias.'),
      MapEntry('Guarda e Convivência',
          'Análise de guarda compartilhada ou unilateral, residência de referência, convivência familiar e questões relacionadas ao melhor interesse de crianças e adolescentes.'),
      MapEntry('Pensão Alimentícia',
          'Orientação sobre fixação, revisão, exoneração e cobrança de alimentos, conforme as necessidades e possibilidades envolvidas.'),
      MapEntry('Inventário e Sucessões',
          'Orientação sobre inventário judicial ou extrajudicial, partilha, herdeiros, testamento e regularização da transmissão de bens.'),
      MapEntry('União Estável',
          'Análise do reconhecimento e dissolução da união estável, regime de bens e possíveis efeitos patrimoniais e sucessórios.'),
      MapEntry('Partilha de Bens',
          'Análise do regime de bens, patrimônio comum, bens particulares e critérios aplicáveis à divisão patrimonial.'),
    ],
  ),
  AreaJuridica(
    emoji: '💼',
    titulo: 'Direito Trabalhista',
    descricao:
        'Relações de trabalho, verbas rescisórias, jornada, vínculo e conflitos trabalhistas.',
    itens: const [
      MapEntry('Verbas Rescisórias',
          'Análise de saldo salarial, aviso-prévio, férias, décimo terceiro, FGTS e demais parcelas decorrentes do encerramento do contrato.'),
      MapEntry('Horas Extras e Jornada',
          'Orientação sobre jornada de trabalho, intervalos, horas extras, banco de horas, trabalho noturno e registros de ponto.'),
      MapEntry('Reconhecimento de Vínculo',
          'Análise dos elementos da relação de emprego e de situações em que pode haver discussão sobre reconhecimento do vínculo trabalhista.'),
      MapEntry('FGTS e Obrigações Contratuais',
          'Orientação sobre depósitos do FGTS e outras obrigações decorrentes do contrato de trabalho.'),
      MapEntry('Acidente e Doença do Trabalho',
          'Análise jurídica de acidentes e doenças relacionados ao trabalho, estabilidade e possíveis repercussões trabalhistas.'),
      MapEntry('Defesa Trabalhista',
          'Orientação e atuação em reclamações trabalhistas, análise documental, elaboração de defesa e acompanhamento processual.'),
    ],
  ),
  AreaJuridica(
    emoji: '🏠',
    titulo: 'Direito Imobiliário',
    descricao:
        'Contratos, propriedade, locação, usucapião, adjudicação e regularização de imóveis.',
    itens: const [
      MapEntry('Compra e Venda de Imóveis',
          'Análise de contratos, documentação, obrigações das partes e riscos jurídicos em operações de compra e venda.'),
      MapEntry('Locação',
          'Orientação sobre contratos de locação, garantias, reajustes, inadimplemento, despejo e direitos e deveres das partes.'),
      MapEntry('Usucapião',
          'Análise dos requisitos da posse e das modalidades de usucapião, inclusive procedimentos judiciais ou extrajudiciais quando cabíveis.'),
      MapEntry('Regularização de Imóveis',
          'Orientação sobre matrícula, registro, documentação, divergências cadastrais e providências para regularização imobiliária.'),
      MapEntry('Adjudicação Compulsória',
          'Análise de situações em que o adquirente busca a transferência definitiva do imóvel diante do não cumprimento da obrigação de outorga.'),
      MapEntry('Posse e Propriedade',
          'Orientação sobre conflitos possessórios, propriedade, condomínio, limites e demais questões relacionadas ao imóvel.'),
    ],
  ),
  AreaJuridica(
    emoji: '🛒',
    titulo: 'Direito do Consumidor',
    descricao:
        'Cobranças, contratos, produtos e serviços, negativação e responsabilidade de fornecedores.',
    itens: const [
      MapEntry('Cobrança Indevida',
          'Análise de cobranças não reconhecidas, valores indevidos e providências disponíveis ao consumidor.'),
      MapEntry('Negativação e Cadastro de Crédito',
          'Orientação sobre inscrições em cadastros de inadimplentes, regularidade da cobrança e eventual contestação.'),
      MapEntry('Produtos e Serviços',
          'Análise de vícios, defeitos, descumprimento da oferta, garantia e responsabilidade de fornecedores.'),
      MapEntry('Contratos de Consumo',
          'Orientação sobre cláusulas contratuais, cancelamentos, cobranças, obrigações e possíveis abusividades.'),
      MapEntry('Bancos e Financeiras',
          'Análise de relações bancárias e financeiras sob a ótica do direito do consumidor, conforme as circunstâncias do caso.'),
      MapEntry('Responsabilidade e Indenização',
          'Análise de eventuais danos materiais ou morais decorrentes de relações de consumo e dos requisitos para responsabilização.'),
    ],
  ),
  AreaJuridica(
    emoji: '💰',
    titulo: 'Direito Previdenciário',
    descricao:
        'Aposentadorias, benefícios por incapacidade, BPC, pensão e recursos perante o INSS.',
    itens: const [
      MapEntry('Aposentadorias',
          'Orientação sobre requisitos, tempo de contribuição, idade, regras de transição e documentação para benefícios de aposentadoria.'),
      MapEntry('Benefícios por Incapacidade',
          'Análise de auxílio por incapacidade temporária e aposentadoria por incapacidade permanente, conforme requisitos legais e médicos.'),
      MapEntry('BPC/LOAS',
          'Orientação sobre o benefício assistencial à pessoa idosa ou com deficiência e os critérios legais para sua concessão.'),
      MapEntry('Pensão por Morte',
          'Análise de dependência, qualidade de segurado, duração e demais requisitos relacionados à pensão por morte.'),
      MapEntry('Revisão de Benefícios',
          'Análise da concessão e do cálculo de benefícios para verificar possíveis questões jurídicas passíveis de revisão.'),
      MapEntry('Requerimentos e Recursos no INSS',
          'Orientação sobre requerimentos administrativos, documentação, decisões do INSS e recursos cabíveis.'),
    ],
  ),
  AreaJuridica(
    emoji: '🏢',
    titulo: 'Direito Empresarial',
    descricao:
        'Contratos empresariais, sociedades, responsabilidade de sócios e recuperação de créditos.',
    itens: const [
      MapEntry('Contratos Empresariais',
          'Elaboração e análise de contratos comerciais, prestação de serviços, fornecimento e outros instrumentos utilizados na atividade empresarial.'),
      MapEntry('Sociedades e Sócios',
          'Orientação sobre constituição, alterações societárias, direitos e deveres dos sócios e organização das relações internas.'),
      MapEntry('Responsabilidade dos Sócios',
          'Análise das hipóteses de responsabilidade patrimonial e das circunstâncias jurídicas relacionadas às obrigações da sociedade.'),
      MapEntry('Cobrança e Recuperação de Créditos',
          'Orientação sobre cobrança extrajudicial ou judicial e medidas destinadas à recuperação de créditos empresariais.'),
      MapEntry('Dissolução Societária',
          'Análise de retirada, exclusão de sócios, dissolução, apuração de haveres e demais efeitos jurídicos.'),
      MapEntry('Consultoria Preventiva',
          'Análise jurídica preventiva de contratos, procedimentos e situações empresariais para identificação e redução de riscos.'),
    ],
  ),
  AreaJuridica(
    emoji: '🔐',
    titulo: 'Direito Digital e LGPD',
    descricao:
        'Privacidade, proteção de dados, contratos digitais, incidentes e direitos dos titulares.',
    itens: const [
      MapEntry('Proteção de Dados Pessoais',
          'Orientação sobre tratamento de dados pessoais, bases legais, finalidades, segurança e responsabilidades previstas na LGPD.'),
      MapEntry('Direitos do Titular',
          'Informações sobre acesso, correção, eliminação, portabilidade e demais direitos relacionados aos dados pessoais.'),
      MapEntry('Incidentes e Vazamento de Dados',
          'Análise jurídica de incidentes de segurança, exposição de informações e providências relacionadas à proteção dos titulares.'),
      MapEntry('Adequação à LGPD',
          'Orientação sobre políticas, procedimentos, contratos e práticas necessárias à conformidade com a legislação de proteção de dados.'),
      MapEntry('Contratos e Relações Digitais',
          'Análise de contratos eletrônicos, serviços digitais, plataformas e obrigações estabelecidas no ambiente online.'),
      MapEntry('Responsabilidade no Ambiente Digital',
          'Orientação sobre conteúdo, privacidade, uso indevido de informações e outras situações jurídicas decorrentes de atividades digitais.'),
    ],
  ),
  AreaJuridica(
    emoji: '⚖',
    titulo: 'Direito Criminal',
    descricao:
        'Defesa criminal, inquéritos, processos, medidas cautelares e acompanhamento jurídico.',
    itens: const [
      MapEntry('Inquérito Policial',
          'Orientação e acompanhamento jurídico durante investigações, análise dos autos e assistência nos atos pertinentes.'),
      MapEntry('Processo Criminal',
          'Defesa técnica, análise das acusações e provas, elaboração de manifestações e acompanhamento das fases processuais.'),
      MapEntry('Prisão e Medidas Cautelares',
          'Análise jurídica de prisões e medidas cautelares, observando as circunstâncias do caso e os instrumentos processuais cabíveis.'),
      MapEntry('Audiências',
          'Preparação e acompanhamento jurídico em audiências e demais atos do processo penal.'),
      MapEntry('Recursos Criminais',
          'Análise de decisões judiciais e dos recursos previstos na legislação processual penal quando aplicáveis.'),
      MapEntry('Orientação Preventiva',
          'Esclarecimento jurídico sobre situações com possíveis repercussões penais, respeitando a análise individual de cada caso.'),
    ],
  ),
  AreaJuridica(
    emoji: '⚕',
    titulo: 'Direito Médico e da Saúde',
    descricao:
        'Relações médico-paciente, planos de saúde, responsabilidade profissional e acesso a tratamentos.',
    itens: const [
      MapEntry('Planos de Saúde',
          'Orientação sobre cobertura contratual, autorizações, negativas, reajustes e outras questões relacionadas aos planos de assistência à saúde.'),
      MapEntry('Acesso a Tratamentos',
          'Análise jurídica de situações envolvendo medicamentos, procedimentos, exames e tratamentos conforme as circunstâncias específicas.'),
      MapEntry('Responsabilidade Profissional',
          'Análise de questões jurídicas envolvendo a atuação de profissionais e estabelecimentos de saúde, considerando documentos e fatos do caso.'),
      MapEntry('Relação Médico-Paciente',
          'Orientação sobre direitos, deveres, informação, consentimento e documentação na relação entre profissionais e pacientes.'),
      MapEntry('Prontuário e Documentação Médica',
          'Orientação sobre acesso, guarda e utilização jurídica de prontuários, laudos, exames e demais documentos de saúde.'),
      MapEntry('Demandas Administrativas e Judiciais',
          'Análise das medidas administrativas ou judiciais possíveis em questões relacionadas à assistência e ao direito à saúde.'),
    ],
  ),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void abrirArea(BuildContext context, AreaJuridica area) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 280),
        reverseTransitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (_, animation, secondaryAnimation) => AreaPage(area: area),
        transitionsBuilder: (_, animation, secondaryAnimation, child) {
          final entrada = Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.easeOutCubic));

          return SlideTransition(
            position: animation.drive(entrada),
            child: child,
          );
        },
      ),
    );
  }

  Widget secao(String titulo, String texto) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titulo,
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF12436C))),
          const SizedBox(height: 7),
          Text(texto,
              style: const TextStyle(fontSize: 14, color: Colors.black87)),
        ],
      ),
    );
  }

  Widget areaCard(BuildContext context, AreaJuridica area) {
    return InkWell(
      onTap: () => abrirArea(context, area),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(17),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${area.emoji} ${area.titulo}',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF12436C))),
            const SizedBox(height: 6),
            Text(area.descricao,
                style: const TextStyle(fontSize: 14, color: Colors.black87)),
            const SizedBox(height: 5),
            const Text('Ver informações  ›',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF145396))),
          ],
        ),
      ),
    );
  }

  Widget linkNorma(String texto, String endereco) {
    return InkWell(
      onTap: () => abrirUrl(endereco),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        child: Center(
          child: Text(
            texto,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Color(0xFF145396), fontSize: 14),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const Rodape(),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 22, 20, 28),
          child: Column(
            children: [
              const Text('ADVOGADO SIMPLÍCIO',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF103558))),
              const SizedBox(height: 7),
              const Text('Informação jurídica • Conteúdo • Atendimento',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.black87)),
              const SizedBox(height: 14),
              const Text('Dr. Marcelo Simplício\nAdvogado • OAB/SP nº 409261',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF103558))),
              const SizedBox(height: 16),
              secao('Atuação Jurídica',
                  'Informações organizadas por área do Direito. Selecione um tema para conhecer questões jurídicas frequentes e formas de atendimento.'),
              ...areas.map((a) => areaCard(context, a)),
              secao('Sobre o Advogado',
                  'Dr. Marcelo Simplício – Advogado\nOAB/SP nº 409261\n\nAtendimento jurídico com análise individualizada das circunstâncias e documentos de cada caso.'),
              secao('Importante',
                  'O conteúdo deste aplicativo possui caráter exclusivamente informativo e não substitui consulta ou análise jurídica individualizada.'),
              const SizedBox(height: 14),
              const Text('Legislação e normas profissionais',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF12375C))),
              linkNorma('Estatuto da Advocacia e da OAB – Lei nº 8.906/1994',
                  estatutoOab),
              linkNorma('Código de Ética e Disciplina da OAB', codigoEtica),
              linkNorma('Provimento nº 205/2021 – Publicidade na Advocacia',
                  provimento205),
              linkNorma('Política de Privacidade', politicaPrivacidade),
            ],
          ),
        ),
      ),
    );
  }
}

class AreaPage extends StatelessWidget {
  final AreaJuridica area;

  const AreaPage({super.key, required this.area});

  Widget secao(String titulo, String texto) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(17),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titulo,
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF12436C))),
          const SizedBox(height: 7),
          Text(texto,
              style: const TextStyle(fontSize: 14, color: Colors.black87)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const Rodape(),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 14, 20, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton.icon(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.chevron_left),
                label: const Text('Voltar ao início'),
                style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFF12436C)),
              ),
              const SizedBox(height: 8),
              Text(area.titulo,
                  style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF103558))),
              const SizedBox(height: 12),
              ...area.itens.map((e) => secao(e.key, e.value)),
              const SizedBox(height: 14),
              SizedBox(
                width: double.infinity,
                height: 58,
                child: ElevatedButton(
                  onPressed: () => abrirWhatsApp(area.titulo),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF194E7D),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2)),
                  ),
                  child: Text('Solicitar atendimento sobre ${area.titulo}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 15)),
                ),
              ),
              const SizedBox(height: 15),
              secao('Aviso',
                  'As informações apresentadas são gerais e educativas. A solução jurídica depende da análise individual de cada caso.'),
            ],
          ),
        ),
      ),
    );
  }
}

class Rodape extends StatelessWidget {
  const Rodape({super.key});

  Widget botao(IconData icone, String texto, VoidCallback acao) {
    return Expanded(
      child: InkWell(
        onTap: acao,
        child: SizedBox(
          height: 64,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icone, color: Colors.white, size: 22),
              const SizedBox(height: 3),
              Text(texto,
                  style: const TextStyle(color: Colors.white, fontSize: 11)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF14304C),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            botao(Icons.home, 'Início', () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            }),
            botao(Icons.language, 'Site', () => abrirUrl(site)),
            botao(Icons.phone_android, 'WhatsApp',
                () => abrirWhatsApp('atendimento jurídico')),
            botao(Icons.email, 'E-mail', abrirEmail),
          ],
        ),
      ),
    );
  }
}
